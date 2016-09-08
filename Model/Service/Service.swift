//
//  Service.swift
//  Model
//
//  Created by Giáp Trần on 9/1/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

public class Service {
    
    // MARK: Property
    
    internal let apiHelper: ApiHelper
    
    internal var dataError: NSError {
        return NSError(domain: "Can't receive data. Please try again!", code: 0, userInfo: nil)
    }
    
    // MARK: Contructor
    
    public init(apiHelper: ApiHelper) {
        self.apiHelper = apiHelper
    }
    
}