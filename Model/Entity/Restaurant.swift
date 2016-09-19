//
//  Restaurant.swift
//  Model
//
//  Created by Giáp Trần on 9/1/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import SwiftyJSON
import RealmSwift

public class Restaurant: Entity {
    
    // MARK: Property
    
    public static let Replace   = "ReplaceRestaurant"
    public static let Update    = "UpdateRestaurant"
    
    dynamic var name: String?
    dynamic var address: String?
    dynamic var openTime: String?
    dynamic var closeTime: String?
    dynamic var categoryId: Int = 0
    dynamic var phoneNumber: String?
    dynamic var image: String?
    dynamic var content: String?
    
    var comments: List<Comment>?
    
    // MARK: Override method
    
    public override static func primaryKey() -> String? {
        return "id"
    }
    
    // MARK: Override method
    
    public override class func from<T: Restaurant>(json: JSON, inout output: T?) {
        super.from(json, output: &output)
        
        output!.name = json["name"].string
        output!.address = json["address"].string
        output!.openTime = json["open_time"].string
        output!.closeTime = json["close_time"].string
        output!.categoryId = json["category_id"].intValue
        output!.phoneNumber = json["phone_number"].string
        output!.image = json["image"].string
        output!.content = json["content"].string
        
        if let commentsJson = json["comments"].array {
            output!.comments = List<Comment>()
            
            for commentJson in commentsJson {
                var comment: Comment?
                Comment.from(commentJson, output: &comment)
                
                output!.comments!.append(comment!)
            }
        }
    }
    
}