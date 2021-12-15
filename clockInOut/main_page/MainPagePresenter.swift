//
//  MainPagePresenter.swift
//  clockInOut
//
//  Created armyxx on 2/12/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class MainPagePresenter: MainPagePresenterProtocol {

    weak private var view: MainPageViewProtocol?
    var interactor: MainPageInteractorProtocol?
    private let router: MainPageWireframeProtocol
    
    let months:[String] = ["January", "February", "March", "April", "May", "June",
                           "July", "August", "September", "October", "November", "December"]

    init(interface: MainPageViewProtocol, interactor: MainPageInteractorProtocol?, router: MainPageWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func getDateTime() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            let date = Date()
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateFormat = "hh:mm:ss a"
            
            let currentTime = dateFormatter.string(from: date)
            
            dateFormatter.dateFormat = "dd/MM/yyyy"
            
            let calendar = Calendar.current
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            let monthInWords = self.months[month - 1]
            
            var dayString = String(day)
            
            let lastDayString = dayString.last!

            if lastDayString == "1" {
                dayString = dayString+"st"
            } else if lastDayString == "2" {
                dayString = dayString+"nd"
            } else if lastDayString == "2" {
                dayString = dayString+"rd"
            } else {
                dayString = dayString+"th"
            }
            
            let year = calendar.component(.year, from: date)
            let currentDate = "\(dayString) \(monthInWords) \(year)"
            
            self.view?.showDateTime(currentDate: currentDate, currentTime: currentTime)
        }
    }
}
