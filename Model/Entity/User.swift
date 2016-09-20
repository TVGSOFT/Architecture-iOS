//
//  User.swift
//  Model
//
//  Created by Giáp Trần on 9/1/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import SwiftyJSON

public class User: Entity {
    
    // MARK: Property
    
    dynamic var name: String?
    dynamic var email: String?
    dynamic var password: String?
    
    // MARK: Override method
    
    public override class func fromJson<T: User>(json: JSON, inout output: T?) {
        super.fromJson(json, output: &output)
        
        output!.name = json["name"].string
        output!.email = json["email"].string
        output!.password = json["password"].string
    }
    
}