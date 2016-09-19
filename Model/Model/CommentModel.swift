//
//  CommentModel.swift
//  Model
//
//  Created by Giáp Trần on 9/8/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import RealmSwift

public class CommentModel: BaseModel {
    
    // MARK: Property
    
    public override var tableName: String {
        return Comment.className()
    }
    
    // MARK: Public method
    
    public func getComment(restaurantId: Int) -> [Comment]? {
        let realm = try! Realm()
        
        let results = realm.objects(Comment.self)
                           .filter("restaurantId = \(restaurantId)")
                           .sorted("updatedAt", ascending: true)
        
        if results.count <= 0 {
            return nil
        }
        
        var comments = [Comment]()
        
        for result in results {
            comments.append(result)
        }
        
        return comments
    }

}
