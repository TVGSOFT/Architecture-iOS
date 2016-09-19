//
//  RestaurantModel.swift
//  Model
//
//  Created by Giáp Trần on 9/8/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import RealmSwift

public class RestaurantModel: BaseModel {

    // MARK: Property
    
    public override var tableName: String {
        return Restaurant.className()
    }
    
    // MARK: Public method
    
    public func getLastest() -> [Restaurant]? {
        let realm = try! Realm()
        
        let results = realm.objects(Restaurant.self)
                           .sorted("updatedAt", ascending: true)
        
        if results.count <= 0 {
            return nil
        }
        
        var restaurants = [Restaurant]()
        for result in results {
            restaurants.append(result)
        }
        
        return restaurants
    }
    
    public func getFavorite() -> [Restaurant]? {
        let realm = try! Realm()
        
        let favoriteResults = realm.objects(Favorite.self)
                                   .sorted("updatedAt", ascending: true)
        if favoriteResults.count <= 0 {
            return nil
        }
        
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
    
    public func getRestaurant(categoryId: Int) -> [Restaurant]? {
        let realm = try! Realm()
        
        let results = realm.objects(Restaurant.self)
                           .filter("categoryId = \(categoryId)")
                           .sorted("updatedAt", ascending: true)
        
        if results.count <= 0 {
            return nil
        }
        
        var restaurants = [Restaurant]()
        for result in results {
            restaurants.append(result)
        }
        
        return restaurants
    }
    
    public func optimize() {
        autoreleasepool {
            let realm = try! Realm()
            
            let results = realm.objects(Restaurant.self)
                .sorted("updatedAt", ascending: true)
            
            realm.beginWrite()
            
            // Remove restaurant has isDeleted = true
            for restaurant in results {
                if restaurant.isDeleted {
                    realm.delete(restaurant)
                }
            }
            
            // Remove old restaurant, but not favorite
            let count = results.count
            if count > Constant.RecordCacheLimited {
                for i in Constant.RecordCacheLimited..<count {
                    let restaurant = results[i]
                    
                    if !isFavorite(realm, restaurantId: restaurant.id) {
                        realm.delete(restaurant)
                    }
                }
            }
            
            try! realm.commitWrite()
        }
    }
    
    // MARK: Private method
    
    private func isFavorite(realm: Realm, restaurantId: Int) -> Bool {
        let results = realm.objects(Favorite.self)
                           .filter("restaurantId = \(restaurantId)")
        
        return results.count > 0
    }
    
}
