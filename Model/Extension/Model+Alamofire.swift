//
//  Alamofire_Extension.swift
//  Model
//
//  Created by Giáp Trần on 9/16/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import Foundation
import Alamofire

extension Request {
    
    public func response() -> (request: NSURLRequest?, response: NSHTTPURLResponse?, data: NSData?, error: NSError?) {
        let semaphore = dispatch_semaphore_create(0)
        
        var result: (request: NSURLRequest?, response: NSHTTPURLResponse?, data: NSData?, error: NSError?)!
        response(queue: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), completionHandler: { request, response, data, error in
            
            result = (
                request: request,
                response: response,
                data: data,
                error: error
            )
            
            dispatch_semaphore_signal(semaphore)
            
        })
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        
        return result
    }
    
    public func responseData() -> Alamofire.Response<NSData, NSError> {
        let semaphore = dispatch_semaphore_create(0)
        
        var result: Alamofire.Response<NSData, NSError>!
        responseData(queue: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), completionHandler: { response in
            
            result = response
            dispatch_semaphore_signal(semaphore)
            
        })
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        
        return result
    }
    
    public func responseJSON(options options: NSJSONReadingOptions = .AllowFragments) -> Alamofire.Response<AnyObject, NSError> {
        let semaphore = dispatch_semaphore_create(0)
        
        var result: Alamofire.Response<AnyObject, NSError>!
        responseJSON(queue: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), options: options, completionHandler: {response in
            
            result = response
            dispatch_semaphore_signal(semaphore)
            
        })
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        
        return result
    }
    
    public func responseString(encoding encoding: NSStringEncoding? = nil) -> Alamofire.Response<String, NSError> {
        let semaphore = dispatch_semaphore_create(0)
        
        var result: Alamofire.Response<String, NSError>!
        responseString(queue: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), encoding: encoding, completionHandler: { response in
            
            result = response
            dispatch_semaphore_signal(semaphore)
            
        })
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        
        return result
    }
    
    public func responsePropertyList(options options: NSPropertyListReadOptions = NSPropertyListReadOptions()) -> Alamofire.Response<AnyObject, NSError> {
        let semaphore = dispatch_semaphore_create(0)
        
        var result: Alamofire.Response<AnyObject, NSError>!
        responsePropertyList(queue: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), options: options, completionHandler: { response in
            
            result = response
            dispatch_semaphore_signal(semaphore)
            
        })
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        
        return result
    }
    
}