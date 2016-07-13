//
//  Menu.swift
//  SCVZ Canteen
//
//  Created by Nikola Majcen on 27/06/16.
//  Copyright © 2016 Nikola Majcen. All rights reserved.
//

import Foundation
import ObjectMapper

class Menu: Mappable {
    
    var id: Int?
    var date: String?
    var lunch: [Meal]?
    var dinner: [Meal]?
    
    required init?(_ map: Map) { }
    
    func mapping(map: Map) {
        id <- map["id"]
        date <- map["date"]
        lunch <- map["lunch"]
        dinner <- map["dinner"]
    }
}