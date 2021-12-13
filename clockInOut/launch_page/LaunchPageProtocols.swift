//
//  LaunchPageProtocols.swift
//  clockInOut
//
//  Created armyxx on 1/12/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol LaunchPageWireframeProtocol: class {
    func routeToLogin()
    func tabBarViewController()
}
//MARK: Presenter -
protocol LaunchPagePresenterProtocol: class {
    func notifyRouteLoginPage()
}

//MARK: Interactor -
protocol LaunchPageInteractorProtocol: class {

    var presenter: LaunchPagePresenterProtocol?  { get set }
}

//MARK: View -
protocol LaunchPageViewProtocol: class {

    var presenter: LaunchPagePresenterProtocol?  { get set }
}
