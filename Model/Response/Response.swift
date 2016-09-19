//
//  ResponseApi.swift
//  Model
//
//  Created by Giáp Trần on 9/5/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import SwiftyJSON

public class Response<T> {
    
    // MARK: Property
    
    public var isSuccess: Bool = false
    public var data: T?
    public var message: String?
    public var lastSyncedAt: NSDate?

    public var error: NSError?
    
    // Public method
    
    public func from(json: JSON) {
        isSuccess = json["success"].boolValue
        message = json["message"].string
        lastSyncedAt = json["last_sync_timestamp"].date
    }
    
}
