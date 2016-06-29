//
//  CanteenStore.swift
//  SCVZ Canteen
//
//  Created by Nikola Majcen on 29/06/16.
//  Copyright © 2016 Nikola Majcen. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class CanteenStore {
    
    func fetchData(completion: ([Menu]!, NSError!) -> Void) -> Void {
        let filePath = NSBundle.mainBundle().pathForResource("example", ofType: "json")
        let data = NSData(contentsOfFile: filePath!)
        let value = String(data: data!, encoding: NSUTF8StringEncoding)
        
        let menus = Mapper<Menu>().mapArray(value!)
        completion(menus, nil)
    }
}