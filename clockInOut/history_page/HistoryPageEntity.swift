//
//  HistoryPageEntity.swift
//  clockInOut
//
//  Created by armyxx on 20/12/2564 BE.
//

import Foundation
import Mapper
import UIKit

class DataHistory: NSObject {

    let date_time: String?
    let status: String?
    let user_email: String?

    init(map: Dictionary<String, Any>) throws {
        date_time = map["date_time"] as? String
        status = map["status"] as? String
        user_email = map["user_email"] as? String
    }
}
