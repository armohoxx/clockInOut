//
//  LoginPagePresenter.swift
//  clockInOut
//
//  Created armyxx on 1/12/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class LoginPagePresenter: LoginPagePresenterProtocol {

    weak private var view: LoginPageViewProtocol?
    var interactor: LoginPageInteractorProtocol?
    private let router: LoginPageWireframeProtocol

    init(interface: LoginPageViewProtocol, interactor: LoginPageInteractorProtocol?, router: LoginPageWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func notifyViewRouteMainPage() {
        self.router.tabBarViewController()
    }
    
    func notifyRouteToSignUpPage() {
        self.router.routeToSignUp()
    }
    
    func notifyCheckLogin(email: String, password: String) {
        self.interactor?.checkLogin(email: email, password: password)
    }
    
    func notifyResetPassword(email: String) {
        self.interactor?.resetPassword(email: email)
    }
    
    func notifySuccessResetAlert() {
        self.view?.showSuccessResetAlert()
    }
    
    func notifyErrorAlert(error: Error?) {
        self.view?.showErrorAlert(error: error)
    }
    
    func notifyFetchValue(newBackground: Bool) {
        self.view?.updateBackground(newBackground: newBackground)
    }
}
