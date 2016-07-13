//
//  CanteenConstans.swift
//  SCVZ Canteen
//
//  Created by Nikola Majcen on 13/07/16.
//  Copyright © 2016 Nikola Majcen. All rights reserved.
//

import Foundation

class CanteenContants {
    
    static let languageEnglish = "en"
    static let languageCroatian = "hr"
    
    static var baseURL: NSURL {
        get {
            return NSURL(string: readConfigurationValue("baseURL", file: "API", type: "plist"))!
        }
    }
    
    static var apiKey: String {
        get {
            return readConfigurationValue("apiKey", file: "API", type: "plist")
        }
    }
    
    private static func readConfigurationValue(key: String, file: String, type: String) -> String! {
        let dictionary: NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: type) {
            dictionary = NSDictionary(contentsOfFile: path) as! [String: AnyObject]
            return (dictionary!.valueForKey(key))! as! String
        }
        return String()
    }
}