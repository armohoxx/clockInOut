//
//  RegisterPagePresenter.swift
//  clockInOut
//
//  Created armyxx on 2/12/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class RegisterPagePresenter: RegisterPagePresenterProtocol {

    weak private var view: RegisterPageViewProtocol?
    var interactor: RegisterPageInteractorProtocol?
    private let router: RegisterPageWireframeProtocol

    init(interface: RegisterPageViewProtocol, interactor: RegisterPageInteractorProtocol?, router: RegisterPageWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func notifyRouteToLogin() {
        self.router.routeToLogin()
    }
    
    func notifyCreatereateUser(firstName: String, lastName: String, email: String, password: String, image_profile: UIImage?) {
        
        self.interactor?.createUser(firstName: firstName, lastName: lastName, email: email, password: password, image_profile: image_profile)
        
    }
    
    func notifyErrorCreateUser(error: Error?) {
        self.view?.showErrorAlert(error: error)
    }
    
    func notifySuccessCreateUser() {
        self.view?.showSuccessAlert()
    }

}
