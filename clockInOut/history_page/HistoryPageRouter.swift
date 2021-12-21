//
//  HistoryPageRouter.swift
//  clockInOut
//
//  Created armyxx on 20/12/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class HistoryPageRouter: HistoryPageWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = HistoryPageViewController(nibName: nil, bundle: nil)
        let interactor = HistoryPageInteractor()
        let router = HistoryPageRouter()
        let presenter = HistoryPagePresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
