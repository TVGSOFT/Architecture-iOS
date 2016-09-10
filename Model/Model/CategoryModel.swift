//
//  CategoryModel.swift
//  Model
//
//  Created by Giáp Trần on 9/8/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

public class CategoryModel: BaseModel {

    // MARK: Property
    
    public override var tableName: String {
        return Category.className()
    }
    
    // MARK: Public method
    
    public func getCategory() -> [Category] {
        let results = realm.objects(Category.self)
                           .sorted("updatedAt")
        
        var categories = [Category]()
        
        for result in results {
           categories.append(result)
        }
        
        return categories
    }
    
}
