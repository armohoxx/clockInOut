//
//  MenuPageInteractor.swift
//  clockInOut
//
//  Created armyxx on 13/12/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import Firebase
import FirebaseAuth

class MenuPageInteractor: MenuPageInteractorProtocol {

    weak var presenter: MenuPagePresenterProtocol?
    
    func doLogout() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            print("singed out")
            UserDefaults.standard.set(false, forKey: "checkLogin")
            self.presenter?.notifyRouteLogin()
        }
        catch {
            print("Something went wrong")
        }
    }
}
