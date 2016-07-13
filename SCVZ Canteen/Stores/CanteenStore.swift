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

class CanteenStore: NSObject {
    
    var alamofireManager: Alamofire.Manager?
    
    override init() {
        super.init()
        self.configurateRequestTimeout()
    }
    
    func fetchMenus(completion: ([Menu]!, NSError!) -> Void) -> Void {
        alamofireManager!
            .request(.GET, CanteenContants.baseURL,
                     parameters: ["id": CanteenContants.apiKey,
                                  "lang": CanteenContants.languageEnglish])
            .responseJSON { response in                
                if response.response == nil {
                    completion(nil,
                        NSError(domain: "No network connection.",
                            code: 0,
                            userInfo: nil))
                    return
                }
                
                switch response.result {
                case .Failure(let error):
                    completion(nil, error)
                    break
                case .Success(let data):
                    let menus = Mapper<Menu>().mapArray(data)
                    completion(menus, nil)
                }
        }
    }
    
    private func configurateRequestTimeout() {
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.timeoutIntervalForRequest = 5
        self.alamofireManager = Alamofire.Manager(configuration: configuration)
    }
}