//
//  MainPageProtocols.swift
//  clockInOut
//
//  Created armyxx on 2/12/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol MainPageWireframeProtocol: class {

}
//MARK: Presenter -
protocol MainPagePresenterProtocol: class {
    func getDateTime()
}

//MARK: Interactor -
protocol MainPageInteractorProtocol: class {

    var presenter: MainPagePresenterProtocol?  { get set }
}

//MARK: View -
protocol MainPageViewProtocol: class {

    var presenter: MainPagePresenterProtocol?  { get set }
    func showDateTime(currentDate: String, currentTime: String)
}
