//
//  FoodModel.swift
//  Model
//
//  Created by Giáp Trần on 9/8/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import RealmSwift

public class FoodModel: BaseModel {
    
    // MARK: Property
    
    public override var tableName: String {
        return Food.className()
    }
    
    // MARK: Public method
    
    public func getFoodOfRestaurant(restaurantId: Int) -> [Food]? {
        let realm = try! Realm()
        
        let results = realm.objects(Food.self)
                           .filter("restaurantId = \(restaurantId)")
                           .sorted("updatedAt", ascending: true)
        
        if results.count <= 0 {
            return nil
        }
        
        var foods = [Food]()
        
        for result in results {
            foods.append(result)
        }
        
        return foods
    }
    
    
    public func getFoodOfCategory(categoryId: Int) -> [Food]? {
        let realm = try! Realm()
        
        let results = realm.objects(Food.self)
                           .filter("categoryId = \(categoryId)")
                           .sorted("updatedAt", ascending: true)
        
        if results.count <= 0 {
            return nil
        }
        
        var foods = [Food]()
        
        for result in results {
            foods.append(result)
        }
        
        return foods
    }
    
}
