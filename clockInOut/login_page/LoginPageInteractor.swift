//
//  LoginPageInteractor.swift
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

class LoginPageInteractor: LoginPageInteractorProtocol {
    
    weak var presenter: LoginPagePresenterProtocol?
    
    //call remote config
    private let remoteConfig = RemoteConfig.remoteConfig()
    
    func checkLogin(email: String, password: String) {
        //Login via firebase authtication
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result, error in
            self?.presenter?.notifyErrorAlert(error: error)
            UserDefaults.standard.set(true, forKey: "checkLogin")
            UserDefaults.standard.set(email, forKey: "username")
            print("signed in")

            self?.presenter?.notifyViewRouteMainPage()
        })
    }
    
    func resetPassword(email: String) {
        //reset password via email and send email to reset
        FirebaseAuth.Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                self.presenter?.notifyErrorAlert(error: error)
            } else {
                self.presenter?.notifySuccessResetAlert()
            }
        }
    }
    
    func fetchValue() {
        let defaults: [String: NSObject] = [
            "shows_new_background": false as NSObject
        ]
        
        //set defaults value to remote config
        remoteConfig.setDefaults(defaults)
        
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        
        //set defaults background via config from remote config
        let cachedValue = self.remoteConfig.configValue(forKey: "shows_new_background").boolValue
        self.presenter?.notifyFetchValue(newBackground: cachedValue)
        
        //get config from remote config exp = 0
        self.remoteConfig.fetch(withExpirationDuration: 0, completionHandler: { status, error in
            if status == .success, error == nil {
                self.remoteConfig.activate(completionHandler: { error in
                    guard error == nil else {
                        return
                    }
                    
                    let value = self.remoteConfig.configValue(forKey: "shows_new_background").boolValue
                    
                    print("---------- \(value)")
                    
                    DispatchQueue.main.async {
                        self.presenter?.notifyFetchValue(newBackground: value)
                    }
                })
            } else {
                print("Someting Wrong")
            }
        })
    }
}
