//
//  RegisterPageProtocols.swift
//  clockInOut
//
//  Created armyxx on 2/12/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol RegisterPageWireframeProtocol: class {

}
//MARK: Presenter -
protocol RegisterPagePresenterProtocol: class {

}

//MARK: Interactor -
protocol RegisterPageInteractorProtocol: class {

  var presenter: RegisterPagePresenterProtocol?  { get set }
}

//MARK: View -
protocol RegisterPageViewProtocol: class {

  var presenter: RegisterPagePresenterProtocol?  { get set }
}