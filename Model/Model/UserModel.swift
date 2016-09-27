//
//  UserModel.swift
//  Model
//
//  Created by Giáp Trần on 9/20/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import RealmSwift

public class UserModel: BaseModel {
    
    // MARK: Property
    
    public override var tableName: String {
        return User.className()
    }
    
    // MARK: Public method

    public var userDefault: User? {
        let realm = try! Realm()
        
        return realm.objects(User.self)
                    .filter("isActived = true")
                    .first
    }
    
}