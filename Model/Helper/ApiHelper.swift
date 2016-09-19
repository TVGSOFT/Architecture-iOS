//
//  ApiHelper.swift
//  Core
//
//  Created by Giáp Trần on 8/26/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import Alamofire
import SwiftyJSON

public class ApiHelper {
    
    // MARK: Properties
    
    private let baseUrl: String
    
    // MARK: Constructor
    
    public init(url: Server) {
        self.baseUrl = url.rawValue
    }

    // MARK: Public method
    
    public func get(function: Function, parameters: [String : AnyObject]? = nil) -> (JSON?, NSError?) {
        return request(.GET, function: function.rawValue, parameters: parameters)
    }
    
    public func get(function: Function,
                    parameters: [String : AnyObject]? = nil,
                    completionHandler: (JSON?, NSError?) -> Void) {
        
        request(
            .GET,
            function: function.rawValue,
            parameters: parameters,
            completionHandler: completionHandler
        )
    }
    
    public func post(function: Function, parameters: [String : AnyObject]? = nil) -> (JSON?, NSError?) {
        return request(.POST, function: function.rawValue, parameters: parameters)
    }
    
    public func post(function: Function,
                     parameters: [String : AnyObject]? = nil,
                     completionHandler: (JSON?, NSError?) -> Void) {
        
        request(
            .POST,
            function: function.rawValue,
            parameters: parameters,
            completionHandler: completionHandler
        )
    }
    
    private func request(method: Alamofire.Method, function: String, parameters: [String : AnyObject]? = nil) -> (JSON?, NSError?) {
        let response = Alamofire.request(method, "\(baseUrl)\(function)", parameters: parameters)
                                .validate()
                                .responseJSON()
        
        if let value = response.result.value {
            let json = JSON(value)
            
            return (json, json.error)
        }
        
        return (nil, response.result.error)
    }
    
    private func request(method: Alamofire.Method,
                         function: String,
                         parameters: [String : AnyObject]? = nil,
                         completionHandler: (JSON?, NSError?) -> Void) {
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        Alamofire.request(method, "\(baseUrl)\(function)", parameters: parameters)
                 .validate()
                 .responseJSON { response in
                
                    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                    
                    switch response.result {
                    case .Success:
                        if let value = response.result.value {
                            let json = JSON(value)
                        
                            completionHandler(json, json.error)
                        
                            return
                        }
                    
                        completionHandler(nil, response.result.error)
                    
                        self.logError(response.result.error)
                    
                    case .Failure(let error):
                        completionHandler(nil, error)
                    
                        self.logError(error)
                    }
        }
    }
    
    private func logError(error: NSError?) {
        print("Error: \(error)")
    }
    
}