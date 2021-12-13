//
//  MenuPageRouter.swift
//  clockInOut
//
//  Created armyxx on 13/12/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class MenuPageRouter: MenuPageWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = MenuPageViewController(nibName: nil, bundle: nil)
        let interactor = MenuPageInteractor()
        let router = MenuPageRouter()
        let presenter = MenuPagePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return UINavigationController(rootViewController: view)
    }
}
