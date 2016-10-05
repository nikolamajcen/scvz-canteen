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
    
    static var baseURL: URL {
        get {
            return URL(string: readConfigurationValue("baseURL", file: "API", type: "plist"))!
        }
    }
    
    static var apiKey: String {
        get {
            return readConfigurationValue("apiKey", file: "API", type: "plist")
        }
    }
    
    fileprivate static func readConfigurationValue(_ key: String, file: String, type: String) -> String! {
        let dictionary: NSDictionary?
        if let path = Bundle.main.path(forResource: file, ofType: type) {
            dictionary = NSDictionary(contentsOfFile: path) as! [String: AnyObject] as NSDictionary?
            return (dictionary!.value(forKey: key))! as! String
        }
        return String()
    }
}
