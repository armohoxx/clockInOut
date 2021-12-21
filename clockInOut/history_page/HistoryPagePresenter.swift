//
//  HistoryPagePresenter.swift
//  clockInOut
//
//  Created armyxx on 20/12/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class HistoryPagePresenter: HistoryPagePresenterProtocol {

    weak private var view: HistoryPageViewProtocol?
    var interactor: HistoryPageInteractorProtocol?
    private let router: HistoryPageWireframeProtocol

    init(interface: HistoryPageViewProtocol, interactor: HistoryPageInteractorProtocol?, router: HistoryPageWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func notifyHistoryData() {
        self.interactor?.setDataHistory()
    }
    
    func getHistoryData(dataHistory: [DataHistory]) {
        self.view?.showDataHistory(dataHistory: dataHistory)
    }

}