//
//  Favorite.swift
//  Model
//
//  Created by Giáp Trần on 9/5/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import SwiftyJSON

public class Favorite: Entity {
    
    // MARK: Property
    
    dynamic var restaurantId: Int = 0
    dynamic var userId: Int = 0
    
    // MARK: Override method
    
    public override class func fromJson<T: Favorite>(json: JSON, inout output: T?) {
        super.fromJson(json, output: &output)
        
        output!.restaurantId = json["restaurant_id"].intValue
        output!.userId = json["user_id"].intValue
    }
    
}