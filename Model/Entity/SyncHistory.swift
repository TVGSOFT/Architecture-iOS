//
//  SyncHistory.swift
//  Model
//
//  Created by Giáp Trần on 9/5/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import SwiftyJSON

public class SyncHistory: Entity {
    
    // MARK: Property
    
    dynamic var tableName: String?
    dynamic var lastSyncedAt: NSDate?
    
    // MARK: Override method
    
    public override class func fromJson<T: SyncHistory>(json: JSON, inout output: T?) {
        super.fromJson(json, output: &output)
        
        output!.tableName = json["name_table"].string
        output!.lastSyncedAt = json["last_sync_timestamp"].date
    }
    
}
