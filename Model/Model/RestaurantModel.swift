//
//  RestaurantModel.swift
//  Model
//
//  Created by Giáp Trần on 9/8/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

public class RestaurantModel: BaseModel {

    // MARK: Property
    
    public override var tableName: String {
        return Restaurant.className()
    }
    
    // MARK: Public method
    
    public func getLastest() -> [Restaurant] {
        let results = realm.objects(Restaurant.self)
                           .sorted("updatedAt")
        
        var restaurants = [Restaurant]()
        
        for result in results {
            restaurants.append(result)
        }
        
        return restaurants
    }
    
    public func getFavorite() -> [Restaurant] {
        let favoriteResults = realm.objects(Favorite.self)
        
        var restaurants = [Restaurant]()
        
        for result in favoriteResults {
            let results = realm.objects(Restaurant.self)
                               .filter("id = \(result.restaurantId)")
            
            if let restaurant = results.first {
                restaurants.append(restaurant)
            }
        }
        
        return restaurants
    }
    
    public func getRestaurant(categoryId: Int) -> [Restaurant] {
        let results = realm.objects(Restaurant.self)
                           .filter("categoryId = \(categoryId)")
                           .sorted("updatedAt")
        
        var restaurants = [Restaurant]()
        
        for result in results {
            restaurants.append(result)
        }
        
        return restaurants
    }
    
}
