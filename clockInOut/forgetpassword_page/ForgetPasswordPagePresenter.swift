//
//  ForgetPasswordPagePresenter.swift
//  clockInOut
//
//  Created armyxx on 2/12/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ForgetPasswordPagePresenter: ForgetPasswordPagePresenterProtocol {

    weak private var view: ForgetPasswordPageViewProtocol?
    var interactor: ForgetPasswordPageInteractorProtocol?
    private let router: ForgetPasswordPageWireframeProtocol

    init(interface: ForgetPasswordPageViewProtocol, interactor: ForgetPasswordPageInteractorProtocol?, router: ForgetPasswordPageWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}