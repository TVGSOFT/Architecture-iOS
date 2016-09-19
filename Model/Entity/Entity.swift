//
//  Entity.swift
//  Model
//
//  Created by Giáp Trần on 9/1/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import RealmSwift
import SwiftyJSON

public class Entity: Object {
    
    // MARK: Property
    
    public static let Error = "Error"
    
    dynamic var id: Int = 0
    dynamic var createdAt: NSDate?
    dynamic var updatedAt: NSDate?
    dynamic var deletedAt: NSDate?
    
    public var isDeleted: Bool {
        return deletedAt != nil
    }
    
    // MARK: Public method
    
    public class func from<T: Entity>(json: JSON, inout output: T?) {
        output = T()
        output!.id = json["id"].intValue
        output!.createdAt = json["created_at"].date
        output!.updatedAt = json["updated_at"].date
        output!.deletedAt = json["deleted_at"].date
    }
   
}