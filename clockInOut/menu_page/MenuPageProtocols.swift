//
//  MenuPageProtocols.swift
//  clockInOut
//
//  Created armyxx on 13/12/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol MenuPageWireframeProtocol: class {

}
//MARK: Presenter -
protocol MenuPagePresenterProtocol: class {

}

//MARK: Interactor -
protocol MenuPageInteractorProtocol: class {

  var presenter: MenuPagePresenterProtocol?  { get set }
}

//MARK: View -
protocol MenuPageViewProtocol: class {

  var presenter: MenuPagePresenterProtocol?  { get set }
}