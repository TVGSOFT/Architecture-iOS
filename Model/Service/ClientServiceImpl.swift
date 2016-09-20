//
//  ClientServiceImpl.swift
//  Model
//
//  Created by Giáp Trần on 9/1/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import SwiftyJSON

public class ClientServiceImpl: Service, ClientService {
    
    // MARK: Constructor
    
    public override init(apiHelper: ApiHelper) {
        super.init(apiHelper: apiHelper)
    }
    
    // MARK: ClientService implement
    
    public func getRestaurant(lastSyncedAt: NSDate) -> Response<[Restaurant]> {
        let parameters = [ "last_sync_timestamp" : lastSyncedAt.Utc ]
        
        let response = apiHelper.get(.GetRestaurant, parameters: parameters)
        return handleJson(response.0, error: response.1)
    }
    
    public func getRestaurant(offet: Int, limit: Int) -> Response<[Restaurant]> {
        let parameters = [ "offset" : offet,
                           "limit"  : limit ]
        
        let response = apiHelper.get(.GetRestaurant, parameters: parameters)
        return handleJson(response.0, error: response.1)
    }
    
    public func getRestaurant(categoryId: Int, offet: Int, limit: Int) -> Response<[Restaurant]> {
        let parameters = [ "category_id"    : categoryId,
                           "offset"         : offet,
                           "limit"          : limit ]
        
        let response = apiHelper.get(.GetRestaurant, parameters: parameters)
        return handleJson(response.0, error: response.1)
    }
    
    public func getFavorite(userId: Int) -> Response<[Restaurant]> {
        let parameters = [ "user_id" : userId ]
      
        let response = apiHelper.get(.GetFavorite, parameters: parameters)
        return handleJson(response.0, error: response.1)
    }
    
    public func getFavorite(userId: Int, lastSyncedAt: NSDate) -> Response<[Restaurant]> {
        let parameters = [ "user_id"                : userId,
                           "last_sync_timestamp"    : lastSyncedAt.Utc ]
        
        let response = apiHelper.get(.GetFavorite, parameters: parameters)
        return handleJson(response.0, error: response.1)
    }
    
    public func getFavorite(userId: Int, offet: Int, limit: Int) -> Response<[Restaurant]> {
        let parameters = [ "favorite_user_id"   : userId,
                           "offset"             : offet,
                           "limit"              : limit ]
        
        let response = apiHelper.get(.GetRestaurant, parameters: parameters)
        return handleJson(response.0, error: response.1)
    }
    
    public func addFavorite(favorite: Favorite, completionHandler: (Response<[Restaurant]>) -> Void) {
//        apiHelper.post(.GetFavorite, parameters: nil)  { [unowned self] (json, error) in
        
//            self?.handleJson(json, error: error, completionHandler: completionHandler)
//        }
    }
    
    public func deleteFavorite(favoriteId: Int, completionHandler: (Response<[Bool]>) -> Void) {
        
    }
    
    public func getCategory() -> Response<[Category]> {
        let response = apiHelper.get(.GetRestaurant)
        return handleJson(response.0, error: response.1)
    }
    
    public func getCategory(lastSyncedAt: NSDate) -> Response<[Category]> {
        let parameters = [ "last_sync_timestamp" : lastSyncedAt.Utc ]
        
        let response = apiHelper.get(.GetRestaurant, parameters: parameters)
        return handleJson(response.0, error: response.1)
    }
    
    // MARK: Private method
    
    private func handleJson<T: Entity>(json: JSON?, error: NSError?) -> Response<[T]> {
        let response = Response<[T]>()
        
        if let hasJson = json {
           
            response.fromJson(hasJson)
            
            if response.isSuccess {
                response.data = [T]()
                
                for dataJson in hasJson["data"].arrayValue {
                    var data: T?
                    T.fromJson(dataJson, output: &data)
                    
                    response.data!.append(data!)
                }
            } else {
                response.error = NSError(domain: response.message!, code: 0, userInfo: nil)
            }
        }
        
        if let hasError = error {
            response.error = hasError
        }
        
        return response
    }
    
    private func handleJson<T: Entity>(json: JSON?, error: NSError?) -> Response<T> {
        let response = Response<T>()
        
        if let hasJson = json {
            
            response.fromJson(hasJson)
            
            if response.isSuccess {
                T.fromJson(hasJson["data"], output: &response.data)
            } else {
                response.error = NSError(domain: response.message!, code: 0, userInfo: nil)
            }
        }
        
        if let hasError = error {
            response.error = hasError
        }
        
        return response
    }

    
    private func handleJson<T: Entity>(json: JSON?, error: NSError?, completionHandler: ([T]?, NSError?) -> Void) {
        
        if let hasJson = json {
            let response = Response<[T]>()
            response.fromJson(hasJson)
            
            if response.isSuccess {
                response.data = [T]()
                
                for dataJson in hasJson["data"].arrayValue {
                    var data: T?
                    T.fromJson(dataJson, output: &data)
                    
                    response.data!.append(data!)
                }
                
                completionHandler(response.data!, nil)
            } else {
                completionHandler(nil, NSError(domain: response.message!, code: 0, userInfo: nil))
            }
            
            return
        }
        
        if let hasError = error {
            completionHandler(nil, hasError)
            
            return
        }
        
        completionHandler(nil, self.dataError)
    }
    
    private func handleJson<T: Entity>(json: JSON?, error: NSError?, completionHandler: (T?, NSError?) -> Void) {
        
        if let hasJson = json {
            let response = Response<T>()
            response.fromJson(hasJson)
            
            if response.isSuccess {
                T.fromJson(hasJson["data"], output: &response.data)
                
                completionHandler(response.data!, nil)
            } else {
                completionHandler(nil, NSError(domain: response.message!, code: 0, userInfo: nil))
            }
            
            return
        }
        
        if let hasError = error {
            completionHandler(nil, hasError)
            
            return
        }
        
        completionHandler(nil, self.dataError)
    }
    
}