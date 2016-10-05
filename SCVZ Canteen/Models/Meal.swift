//
//  Meal.swift
//  SCVZ Canteen
//
//  Created by Nikola Majcen on 27/06/16.
//  Copyright © 2016 Nikola Majcen. All rights reserved.
//

import Foundation
import ObjectMapper

class Meal: Mappable {
    
    var icon: Icon?
    var title: String?
    var items: [String]?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        icon <- map["icon"]
        title <- map["title"]
        items <- map["items"]
    }
}
