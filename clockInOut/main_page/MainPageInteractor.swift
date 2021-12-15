//
//  MainPageInteractor.swift
//  clockInOut
//
//  Created armyxx on 2/12/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import Firebase
import FirebaseAuth

class MainPageInteractor: MainPageInteractorProtocol {

    weak var presenter: MainPagePresenterProtocol?
    
    func setClockIn() {
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        
        ref = db.collection("log_clockinout").addDocument(data: [
            "date_time": FieldValue.serverTimestamp(),
            "user_email":  UserDefaults.standard.string(forKey: "username")!,
            "status": "clock-in"
        ]) { err in
            if err != nil {
                print("Error adding document: \(err)")
            } else {
                self.presenter?.notifySuccessAlert(message: "Your are successfully clock in")
                self.presenter?.getBackGroundColor(color: .green)
                UserDefaults.standard.set("green", forKey: "background_color")
            }
        }
    }
    
    func setClockOut() {
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        
        ref = db.collection("log_clockinout").addDocument(data: [
            "date_time": FieldValue.serverTimestamp(),
            "user_email":  UserDefaults.standard.string(forKey: "username")!,
            "status": "clock-out"
        ]) { err in
            if err != nil {
                print("Error adding document: \(err)")
            } else {
                self.presenter?.notifySuccessAlert(message: "Your are successfully clock out")
                self.presenter?.getBackGroundColor(color: .red)
                UserDefaults.standard.set("red", forKey: "background_color")
            }
        }
    }
    
}
