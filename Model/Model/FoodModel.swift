//
//  FoodModel.swift
//  Model
//
//  Created by Giáp Trần on 9/8/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

public class FoodModel: BaseModel {
    
    // MARK: Property
    
    public override var tableName: String {
        return Food.className()
    }
    
    // MARK: Public method
    
    public func getFoodOfRestaurant(restaurantId: Int) -> [Food] {
        let results = realm.objects(Food.self)
                           .filter("restaurantId = \(restaurantId)")
                           .sorted("updatedAt")
        
        var foods = [Food]()
        
        for result in results {
            foods.append(result)
        }
        
        return foods
    }
    
    
    public func getFoodOfCategory(categoryId: Int) -> [Food] {
        let results = realm.objects(Food.self)
                           .filter("categoryId = \(categoryId)")
                           .sorted("updatedAt")
        
        var foods = [Food]()
        
        for result in results {
            foods.append(result)
        }
        
        return foods
    }
    
}
