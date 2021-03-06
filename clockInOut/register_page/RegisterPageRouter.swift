//
//  RegisterPageRouter.swift
//  clockInOut
//
//  Created armyxx on 2/12/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class RegisterPageRouter: RegisterPageWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    func routeToLogin() {
        self.viewController?.dismiss(animated: true, completion: nil)
    }
    
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = RegisterPageViewController(nibName: nil, bundle: nil)
        let interactor = RegisterPageInteractor()
        let router = RegisterPageRouter()
        let presenter = RegisterPagePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return UINavigationController(rootViewController: view)
    }
}
