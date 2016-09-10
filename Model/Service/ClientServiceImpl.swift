//
//  ClientServiceImpl.swift
//  Model
//
//  Created by Giáp Trần on 9/1/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

public class ClientServiceImpl: Service, ClientService {
    
    // MARK: Constructor
    
    public override init(apiHelper: ApiHelper) {
        super.init(apiHelper: apiHelper)
    }
    
    // MARK: ClientService implement
    
    public func getRestaurant(categoryId: Int,
                              lastSync: NSDate,
                              offet: Int,
                              limit: Int,
                              successHandler: ([Restaurant]) -> Void,
                              failureHandler: (NSError) -> Void) {
        
        var parameters = [String : AnyObject]()
//        parameters["category_id"] = categoryId
//        parameters["last_sync_timestamp"] = lastSync.Utc
//        parameters["offet"] = offet
//        parameters["limit"] = limit
        
        self.apiHelper
            .get(.GetRestaurant, parameters: parameters) { (json, error) in
               
                if let hasJson = json {
                    let response = Response<[Restaurant]>()
                    response.from(hasJson)
                    
                    if response.isSuccess {
                        response.data = [Restaurant]()
                        
                        for restaurantJson in hasJson["data"].arrayValue {
                            var restaurant: Restaurant?
                            Restaurant.from(restaurantJson, output: &restaurant)
                            
                            response.data!.append(restaurant!)
                        }
                        
                        successHandler(response.data!)
                    } else {
                        failureHandler(NSError(domain: response.message!, code: 0, userInfo: nil))
                    }
                    
                    return
                }
                
                if let hasError = error {
                    failureHandler(hasError)
                    
                    return;
                }
                
                failureHandler(self.dataError)
                
        }
    }
    
    public func getCategory(lastSync: NSDate,
                            offet: Int,
                            limit: Int,
                            successHandler: ([Category]) -> Void,
                            failureHandler: (NSError) -> Void) {
        
        
        var parameters = [String : AnyObject]()
        parameters["last_sync_timestamp"] = lastSync.Utc
        parameters["offet"] = offet
        parameters["limit"] = limit
        
        self.apiHelper
            .get(.GetCategory, parameters: parameters) { (json, error) in
                
                if let hasJson = json {
                    let response = Response<[Category]>()
                    response.from(hasJson)
                    
                    if response.isSuccess {
                        response.data = [Category]()
                        
                        for categoryJson in hasJson["data"].arrayValue {
                            var category: Category?
                            Category.from(categoryJson, output: &category)
                            
                            response.data!.append(category!)
                        }
                        
                        successHandler(response.data!)
                    } else {
                        failureHandler(NSError(domain: response.message!, code: 0, userInfo: nil))
                    }
                    
                    return
                }
                
                if let hasError = error {
                    failureHandler(hasError)
                    
                    return;
                }
                
                failureHandler(self.dataError)
        }
    }
    
}