//
//  Comment.swift
//  Model
//
//  Created by Giáp Trần on 9/1/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import SwiftyJSON

public class Comment: Entity {
    
    // MARK: Property
    
    dynamic var title: String?
    dynamic var content: String?
    dynamic var commenter: User?

    dynamic var clientId: String?
    
    // MARK: Public method
    
    public override class func from<T: Comment>(json: JSON, inout output: T?) {
        super.from(json, output: &output)
        
        output!.title = json["title"].string
        output!.content = json["content"].string
        
        User.from(json["commenter"], output: &output!.commenter)
    }
    
}
