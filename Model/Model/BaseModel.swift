//
//  BaseModel.swift
//  Model
//
//  Created by Giáp Trần on 9/8/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import RealmSwift

public class BaseModel {

    // MARK: Property
    
    internal let realm: Realm
    
    // MARK: Constructor
    
    public init(realm: Realm) {
        self.realm = realm
    }
    
}
