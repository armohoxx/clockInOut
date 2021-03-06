//
//  LoginPageProtocols.swift
//  clockInOut
//
//  Created armyxx on 1/12/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol LoginPageWireframeProtocol: class {
    func tabBarViewController()
    func routeToSignUp()
}
//MARK: Presenter -
protocol LoginPagePresenterProtocol: class {
    func notifyViewRouteMainPage()
    func notifyRouteToSignUpPage()
    func notifySuccessResetAlert()
    func notifyCheckLogin(email: String, password: String)
    func notifyErrorAlert(error: Error?)
    func notifyResetPassword(email: String)
    func notifyFetchValue(newBackground: Bool)
    func getFetchValue()
}

//MARK: Interactor -
protocol LoginPageInteractorProtocol: class {
    var presenter: LoginPagePresenterProtocol?  { get set }
    func checkLogin(email: String, password: String)
    func resetPassword(email: String)
    func fetchValue()
}

//MARK: View -
protocol LoginPageViewProtocol: class {
    var presenter: LoginPagePresenterProtocol?  { get set }
    func showErrorAlert(error: Error?)
    func showSuccessResetAlert()
    func updateBackground(newBackground: Bool)
}
