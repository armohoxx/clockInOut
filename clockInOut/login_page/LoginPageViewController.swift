//
//  LoginPageViewController.swift
//  clockInOut
//
//  Created armyxx on 1/12/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseRemoteConfig

class LoginPageViewController: UIViewController, LoginPageViewProtocol {

	var presenter: LoginPagePresenterProtocol?
    var togglePasswordClick = false
    let iconTogglePassword = UIImageView()
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var buttonForgetPassword: UIButton!
    @IBOutlet weak var buttonRegister: UIButton!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var navBarLogin: UINavigationBar!
    
    var defaultsImage: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background3")
        backgroundImage.contentMode = .scaleAspectFill
        
        return backgroundImage
    }()
    
    var updatedImages: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background2")
        backgroundImage.contentMode = .scaleAspectFill
        
        return backgroundImage
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Login"
        if #available(iOS 13.0, *) {
            navBarLogin.barTintColor = .secondarySystemBackground
        } else {
            navBarLogin.barTintColor = .white
        }
        
        navBarLogin.delegate = self
        self.showTogglePassword()
        self.presenter?.getFetchValue()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    @IBAction func didTapForgetPassword(_ sender: UIButton) {
        self.showResetPasswordAlert()
    }
    
    @IBAction func didTapRegister(_ sender: UIButton) {
        self.presenter?.notifyRouteToSignUpPage()
    }
    
    @IBAction func didTapLogin(_ sender: UIButton) {
        guard let email = emailField.text?.lowercased().trimmingCharacters(in: .whitespaces), !email.isEmpty,
              let password = passwordField.text?.trimmingCharacters(in: .whitespaces), !password.isEmpty else {
                  self.showEmptyAlert()
            return
        }
        
        self.presenter?.notifyCheckLogin(email: email, password: password)
    }
    
    @objc func toggleTapped(toggleTapGestureRecognizer: UITapGestureRecognizer) {
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
    
    func showTogglePassword() {
        iconTogglePassword.image = UIImage(systemName: "eye.slash.fill")
        
        let contentView = UIView()
        contentView.addSubview(iconTogglePassword)
        
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(systemName: "eye.slash.fill")?.size.width ?? 30,
                                   height: UIImage(systemName: "eye.slash.fill")?.size.height ?? 30)
        iconTogglePassword.frame = CGRect(x: -10, y: 0, width: UIImage(systemName: "eye.slash.fill")?.size.width ?? 30,
                                          height: UIImage(systemName: "eye.slash.fill")?.size.height ?? 30)
        
        self.passwordField.rightView = contentView
        self.passwordField.rightViewMode = .always
        
        let toggleTapGestureRecognizer = UITapGestureRecognizer(target: self, action:
            #selector(toggleTapped(toggleTapGestureRecognizer:)))
        iconTogglePassword.isUserInteractionEnabled = true
        iconTogglePassword.addGestureRecognizer(toggleTapGestureRecognizer)
    }
    
    //change background via value get from remote config
    func updateBackground(newBackground: Bool) {
        if newBackground == false {
            DispatchQueue.main.async {
                self.view.insertSubview(self.defaultsImage, at: 0)
            }
        } else {
            DispatchQueue.main.async {
                self.view.insertSubview(self.updatedImages, at: 0)
            }
        }
    }
    
    func showResetPasswordAlert() {
        let alertController = UIAlertController(title: "Reset Password",
                                                message: "",
                                                preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let confirmAction = UIAlertAction(title: "Continue", style: .default, handler: { _ in
            guard let fieldEmail = alertController.textFields, fieldEmail.count == 1 else {
                return
            }
            let resetEmailField = fieldEmail[0]
            
            self.presenter?.notifyResetPassword(email: resetEmailField.text!)
        })
        
        alertController.addTextField { field in
            field.placeholder = "Please enter your email"
            field.returnKeyType = .continue
            field.keyboardType = .emailAddress
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showSuccessResetAlert() {
        let alertController = UIAlertController(title: "Success",
                                                message: "Password reset email was sent",
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK",
                                         style: .cancel,
                                         handler: nil)
        
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showEmptyAlert() {
        let alertController = UIAlertController(title: "Email or Password is null",
                                                message: "Please enter email and password",
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

extension LoginPageViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.resignFirstResponder()

        return true
    }

}

extension LoginPageViewController: UINavigationBarDelegate {
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}
