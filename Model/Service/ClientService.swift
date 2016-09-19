//
//  ClientService.swift
//  Model
//
//  Created by Giáp Trần on 9/1/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

public protocol ClientService {
    
    func getRestaurant(lastSyncedAt: NSDate) -> Response<[Restaurant]>
    
    func getRestaurant(offet: Int, limit: Int) -> Response<[Restaurant]>
    
    func getRestaurant(categoryId: Int, offet: Int, limit: Int) -> Response<[Restaurant]>
    
    func getFavorite(userId: Int) -> Response<[Restaurant]>
    
    func getFavorite(userId: Int, lastSyncedAt: NSDate) -> Response<[Restaurant]>
    
    func getFavorite(userId: Int, offet: Int, limit: Int) -> Response<[Restaurant]>
    
    func addFavorite(favorite: Favorite, completionHandler: (Response<[Restaurant]>) -> Void)
    
    func deleteFavorite(favoriteId: Int, completionHandler: (Response<[Bool]>) -> Void)
    
    func getCategory() -> Response<[Category]>
    
    func getCategory(lastSyncedAt: NSDate) -> Response<[Category]>
    
}