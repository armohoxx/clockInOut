//
//  ProfilePageEntity.swift
//  clockInOut
//
//  Created by armyxx on 17/12/2564 BE.
//

import Foundation
import Mapper
import UIKit

class DataUser: NSObject, Mappable {
    let uid: String
    let firstname: String?
    let lastname: String?
 
    required init(map: Mapper) throws {
        uid = try map.from("images_id")
        firstname = map.optionalFrom("numsort") ?? ""
        lastname = map.optionalFrom("name_main") ?? ""
    }
}
