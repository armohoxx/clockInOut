//
//  ProfilePageInteractor.swift
//  clockInOut
//
//  Created armyxx on 17/12/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import Firebase
import FirebaseAuth

class ProfilePageInteractor: ProfilePageInteractorProtocol {

    weak var presenter: ProfilePagePresenterProtocol?
    let db = Firestore.firestore()
    var dataUser: DataUser?
    var dataUserArray: [DataUser] = []
    var urlImagesFromFirestore: String = ""
    
    func setDataFromFirestore() {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        db.collection("user").whereField("uid", isEqualTo: userID)
            .getDocuments() { (querySnapshot, err) in
                
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    
                    for document in querySnapshot!.documents {
                        let firstname = document.data()["firstname"] as! String
                        let lastname = document.data()["lastname"] as! String
                        let uid = document.data()["uid"] as! String
                        
                        self.presenter?.getDataFromFirestore(firstname: firstname, lastname: lastname, uid: uid)
                    }
                    
                }
        }
    }
    
    func resetPassword(email: String) {
        //reset password via email and send email to reset
        FirebaseAuth.Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                self.presenter?.notifyErrorAlert(error: error)
            } else {
                self.presenter?.notifyAlert(title: "Success", message: "Sended email reset password")
            }
        }
    }
    
    func deleteUser(confirmDelete: String) {
        let user = Auth.auth().currentUser
        let confirmStringToDelete = "ConfirmDelete"
        
        if confirmStringToDelete == confirmDelete {
            guard let userID = Auth.auth().currentUser?.uid else { return }
            
            db.collection("user").whereField("uid", isEqualTo: userID)
                .getDocuments() { (querySnapshot, err) in
                    
                    if let err = err {
                        self.presenter?.notifyErrorAlert(error: err)
                    } else {
                        self.db.collection("user")
                            .document(querySnapshot!.documents.first!.documentID)
                            .delete() { err in
                                
                            if let err = err {
                                self.presenter?.notifyErrorAlert(error: err)
                            } else {
                                print("Document successfully removed!")
                                
                                user?.delete { error in
                                  if let error = error {
                                      self.presenter?.notifyErrorAlert(error: error)
                                  } else {
                                      self.presenter?.notifyDeleteSuccessAlert(title: "Success", message: "Delete Account Success")
                                  }
                                }
                            }
                        }
                    }
            }
        } else {
            self.presenter?.notifyAlert(title: "Someting Wrong", message: "Please enter correct information")
        }
    }
    
    func setLogoutAfterDeleteUserData() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            print("singed out")
            UserDefaults.standard.set(false, forKey: "checkLogin")
            UserDefaults.standard.set(nil, forKey: "username")
            UserDefaults.standard.set("secondarySystemBackground", forKey: "background_color")
            
            self.presenter?.notifyRouteLogin()
        }
        catch {
            print("Something went wrong")
        }
    }
    
    func dowloadProfileImage() {
        guard let userUid = Auth.auth().currentUser?.uid else { return }
        
        db.collection("images_profile")
          .whereField("uid", isEqualTo: userUid)
          .getDocuments() { (result, err) in
              if let err = err {
                  self.presenter?.notifyErrorAlert(error: err)
              } else {
                  
                  for document in result!.documents {
                      self.urlImagesFromFirestore = document.data()["imageUrl"] as! String
                  }
                  
//                  print(self.urlImagesFromFirestore)
                  self.presenter?.getProfileImage(image_profile: self.urlImagesFromFirestore)
              }
              
          }
    }
    
}
