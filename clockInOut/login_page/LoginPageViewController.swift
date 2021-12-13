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

class LoginPageViewController: UIViewController, LoginPageViewProtocol {

	var presenter: LoginPagePresenterProtocol?
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var buttonForgetPassword: UIButton!
    @IBOutlet weak var buttonRegister: UIButton!
    @IBOutlet weak var buttonLogin: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Login"
        if #available(iOS 13.0, *) {
            navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
        } else {
            navigationController?.navigationBar.backgroundColor = .white
        }
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background3")
        backgroundImage.contentMode = .scaleAspectFill

        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    @IBAction func didTapForgetPassword(_ sender: UIButton) {
        
    }
    
    @IBAction func didTapRegister(_ sender: UIButton) {
        
    }
    
    @IBAction func didTapLogin(_ sender: UIButton) {
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
                  self.showEmptyAlert()
            return
        }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result, error in
            self?.showErrorAlert(error: error)
            UserDefaults.standard.set(true, forKey: "checkLogin")
            print("signed in")
            self?.presenter?.notifyViewRouteMainPage()
        })
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