//
//  MenuPagePresenter.swift
//  clockInOut
//
//  Created armyxx on 13/12/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class MenuPagePresenter: MenuPagePresenterProtocol {

    weak private var view: MenuPageViewProtocol?
    var interactor: MenuPageInteractorProtocol?
    private let router: MenuPageWireframeProtocol

    init(interface: MenuPageViewProtocol, interactor: MenuPageInteractorProtocol?, router: MenuPageWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func notifyRouteLogin() {
        self.router.routeToLoginPage()
    }
    
    func notifyLogout() {
        self.interactor?.doLogout()
    }

}
