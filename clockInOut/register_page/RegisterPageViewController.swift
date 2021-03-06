//
//  RegisterPageViewController.swift
//  clockInOut
//
//  Created armyxx on 2/12/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterPageViewController: UIViewController, RegisterPageViewProtocol {

	var presenter: RegisterPagePresenterProtocol?
    var imagePicker: UIImagePickerController!
    var togglePasswordClick = false
    var toggleConfirmPasswordClick = false
    let iconTogglePassword = UIImageView()
    let iconToggleConfirmPassword = UIImageView()

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var buttonSignUp: UIButton!
    @IBOutlet weak var buttonCancel: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
        
        self.setUpImageTap()
        self.showTogglePassword()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        let isLandscape = UIDevice.current.orientation.isLandscape
        
        //ตรวจสอบว่าเป็นเเนวนอนหรือไม่
        if isLandscape == true {
            DispatchQueue.main.async{
                print(UIDevice.current.orientation.isLandscape)
                self.scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+400)
            }
        }
    }
    
    @IBAction func didTapSignUp(_ sender: UIButton) {
        guard let firstName = firstNameField.text, !firstName.isEmpty,
              let lastName = lastNameField.text, !lastName.isEmpty,
              let email = emailField.text?.trimmingCharacters(in: .whitespaces), !email.isEmpty,
              let password = passwordField.text?.trimmingCharacters(in: .whitespaces), !password.isEmpty,
              let confirmPassword = confirmPasswordField.text?.trimmingCharacters(in: .whitespaces), !confirmPassword.isEmpty,
              let profileImage = profileImageView.image else {
                  self.showEmptyAlert()
            return
        }
        
        if (password != confirmPassword) {
            showConfirmPasswordAlert()
        } else {
            self.presenter?.notifyCreatereateUser(firstName: firstName, lastName: lastName, email: email, password: password, image_profile: profileImage)
        }
        
    }
    
    @IBAction func didTapCancel(_ sender: UIButton) {
        self.presenter?.notifyRouteToLogin()
    }
    
    @objc func openImagePicker() {
        self.showImagePickerControlActionSheet()
    }
    
    @objc func togglePasswordTapped(toggleTapGestureRecognizer: UITapGestureRecognizer) {
        let tappedIcon = toggleTapGestureRecognizer.view as! UIImageView
        
        if togglePasswordClick {
            togglePasswordClick = false
            tappedIcon.image = UIImage(systemName: "eye.fill")
            self.passwordField.isSecureTextEntry = false
        } else {
            togglePasswordClick = true
            tappedIcon.image = UIImage(systemName: "eye.slash.fill")
            self.passwordField.isSecureTextEntry = true
        }
    }
    
    @objc func toggleConfirmPasswordTapped(toggleTapGestureRecognizer: UITapGestureRecognizer) {
        let tappedIcon = toggleTapGestureRecognizer.view as! UIImageView
        
        if toggleConfirmPasswordClick {
            toggleConfirmPasswordClick = false
            tappedIcon.image = UIImage(systemName: "eye.fill")
            self.confirmPasswordField.isSecureTextEntry = false
        } else {
            toggleConfirmPasswordClick = true
            tappedIcon.image = UIImage(systemName: "eye.slash.fill")
            self.confirmPasswordField.isSecureTextEntry = true
        }
    }
    
    private func setUpImageTap() {
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(imageTap)
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
    }
    
    func showTogglePassword() {
        iconTogglePassword.image = UIImage(systemName: "eye.slash.fill")
        iconToggleConfirmPassword.image = UIImage(systemName: "eye.slash.fill")
        
        let contentViewPassword = UIView()
        let contentViewConfirmPassword = UIView()
        
        contentViewPassword.addSubview(iconTogglePassword)
        contentViewConfirmPassword.addSubview(iconToggleConfirmPassword)
        
        contentViewPassword.frame = CGRect(x: 0, y: 0, width: UIImage(systemName: "eye.slash.fill")?.size.width ?? 30,
                                           height: UIImage(systemName: "eye.slash.fill")?.size.height ?? 30)
        contentViewConfirmPassword.frame = CGRect(x: 0, y: 0, width: UIImage(systemName: "eye.slash.fill")?.size.width ?? 30,
                                                  height: UIImage(systemName: "eye.slash.fill")?.size.height ?? 30)
        
        iconTogglePassword.frame = CGRect(x: -10, y: 0, width: UIImage(systemName: "eye.slash.fill")?.size.width ?? 30,
                                          height: UIImage(systemName: "eye.slash.fill")?.size.height ?? 30)
        iconToggleConfirmPassword.frame = CGRect(x: -10, y: 0, width: UIImage(systemName: "eye.slash.fill")?.size.width ?? 30,
                                          height: UIImage(systemName: "eye.slash.fill")?.size.height ?? 30)
        
        self.passwordField.rightView = contentViewPassword
        self.passwordField.rightViewMode = .always
        self.confirmPasswordField.rightView = contentViewConfirmPassword
        self.confirmPasswordField.rightViewMode = .always
        
        let togglePasswordTapGesture = UITapGestureRecognizer(target: self, action:
            #selector(togglePasswordTapped(toggleTapGestureRecognizer:)))
        let toggleConfirmPasswordTapGesture = UITapGestureRecognizer(target: self, action:
            #selector(toggleConfirmPasswordTapped(toggleTapGestureRecognizer:)))
        
        iconTogglePassword.isUserInteractionEnabled = true
        iconTogglePassword.addGestureRecognizer(togglePasswordTapGesture)
        iconToggleConfirmPassword.isUserInteractionEnabled = true
        iconToggleConfirmPassword.addGestureRecognizer(toggleConfirmPasswordTapGesture)
    }
    
    func showImagePickerControlActionSheet() {
        let photoLibraryAction = UIAlertAction(title: "Choose from library", style: .default) { (action) in
            self.setUpImagePicker(sourceType: .photoLibrary)
        }
        let cameraAction = UIAlertAction(title: "Take from Camera", style: .default) { (action) in
            self.setUpImagePicker(sourceType: .camera)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        AlertService.showAlert(style: .actionSheet, title: "Choose your image", message: nil, actions: [photoLibraryAction, cameraAction, cancelAction], completion: nil)
    }
    
    func setUpImagePicker(sourceType: UIImagePickerController.SourceType) {
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = sourceType
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func showSuccessAlert() {
        let alertController = UIAlertController(title: "Success",
                                                message: "Success",
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK",
                                     style: .cancel,
                                     handler: { _ in
            
            self.presenter?.notifyRouteToLogin()
            
        })
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showEmptyAlert() {
        let alertController = UIAlertController(title: "Someting Wrong",
                                                message: "Please enter any fields",
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK",
                                         style: .cancel,
                                         handler: nil)
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showConfirmPasswordAlert() {
        let alertController = UIAlertController(title: "Someting Wrong",
                                                message: "Password does not match",
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK",
                                         style: .cancel,
                                         handler: nil)
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showErrorAlert(error: Error?) {
        guard error == nil else {
            let alertController = UIAlertController(title: "Someting Wrong",
                                                    message: "\(error!.localizedDescription)",
                                                    preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK",
                                             style: .cancel,
                                             handler: nil)
            
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
    }
    
}

extension RegisterPageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.profileImageView.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}
