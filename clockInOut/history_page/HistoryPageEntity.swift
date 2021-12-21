//
//  HistoryPageEntity.swift
//  clockInOut
//
//  Created by armyxx on 20/12/2564 BE.
//

import Foundation
import Mapper
import UIKit
import FirebaseFirestore

class DataHistory: NSObject {

    let date_time: Timestamp?
    let status: String?
    let user_email: String?

    init(map: Dictionary<String, Any>) throws {
        date_time = map["date_time"] as? Timestamp
        status = map["status"] as? String
        user_email = map["user_email"] as? String
    }
}
