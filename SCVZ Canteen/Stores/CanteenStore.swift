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
    
    var alamofireManager: Alamofire.SessionManager?
    
    override init() {
        super.init()
        configurateRequestTimeout()
    }
    
    func fetchMenus(_ completion: @escaping ([Menu]?, NSError?) -> Void) -> Void {
        // alamofireManager!
        Alamofire
            .request(CanteenContants.baseURL,
                     method: .get,
                     parameters: ["id": CanteenContants.apiKey, "lang": CanteenContants.languageEnglish],
                     encoding: URLEncoding.default)
            .responseJSON { response in
                if response.response == nil {
                    completion(nil,
                        NSError(domain: "No network connection.",
                            code: 0,
                            userInfo: nil))
                    return
                }
                
                switch response.result {
                case .failure(let error):
                    completion(nil, error as NSError?)
                    break
                case .success(let data):
                    let menus = Mapper<Menu>().mapArray(JSONObject: data)
                    completion(menus, nil)
                }
        }
    }
    
    fileprivate func configurateRequestTimeout() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 5
        // self.alamofireManager = Alamofire.Manager(configuration: configuration)
    }
}
