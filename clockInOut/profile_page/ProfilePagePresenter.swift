//
//  ProfilePagePresenter.swift
//  clockInOut
//
//  Created armyxx on 17/12/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ProfilePagePresenter: ProfilePagePresenterProtocol {

    weak private var view: ProfilePageViewProtocol?
    var interactor: ProfilePageInteractorProtocol?
    private let router: ProfilePageWireframeProtocol

    init(interface: ProfilePageViewProtocol, interactor: ProfilePageInteractorProtocol?, router: ProfilePageWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
    
    func notifyRouteMenu() {
        self.router.backToMenu()
    }
    
    func notifyRouteLogin() {
        self.router.routeToLoginPage()
    }
    
    func notifyDataFromFirestore() {
        self.interactor?.setDataFromFirestore()
    }
    
    func getDataFromFirestore(firstname: String, lastname: String, uid: String) {
        self.view?.showUserData(firstname: firstname, lastname: lastname, uid: uid)
    }
    
    func notifyResetPassword(email: String) {
        self.interactor?.resetPassword(email: email)
    }
    
    func notifyConfirmDelete(confirmDelete: String) {
        self.interactor?.deleteUser(confirmDelete: confirmDelete)
    }
    
    func notifyAlert(title:String, message: String) {
        self.view?.showAlert(title: title, message: message)
    }
    
    func notifyDeleteSuccessAlert(title:String, message: String) {
        self.view?.showDeleteSuccessAlert(title: title, message: message)
    }
    
    func notifyErrorAlert(error: Error?) {
        self.view?.showErrorAlert(error: error)
    }
    
    func getLogout() {
        self.interactor?.setLogoutAfterDeleteUserData()
    }
    
    func getProfileImage(image_profile: String) {
        self.view?.showProfileImage(image_profile: image_profile)
    }
    
    func notifyProfileImage() {
        self.interactor?.dowloadProfileImage()
    }
    
    func notifyUploadImage(image_profile: UIImage?) {
        self.interactor?.uploadProfileImage(image_profile: image_profile)
    }
}
