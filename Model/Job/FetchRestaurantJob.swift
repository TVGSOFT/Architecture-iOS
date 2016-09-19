//
//  FetchRestaurantJob.swift
//  Model
//
//  Created by Giáp Trần on 9/8/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

public class FetchRestaurantJob: BaseJob {

    // MARK: Property
    
    private let service: ClientService
    private let model: RestaurantModel
    
    public var currentPage: Int = -1
    
    public var isFirstSync: Bool {
        return currentPage < 0
    }
    
    // MARK: Constructor
    
    public init(service: ClientService, model: RestaurantModel, priority: NSOperationQueuePriority) {
        self.service = service
        self.model = model
        
        super.init(priority: priority)
    }
    
    // MARK: Override method
    
    public override func main() {
        if isFirstSync {
            if let restaurants = model.getLastest() {
                post(Restaurant.Replace, object: restaurants)
            }
            
            if let lastSyncedAt = model.lastSyncedAt {
                let response = service.getRestaurant(lastSyncedAt)
                
                if (self.cancelled) {
                    return
                }
                
                handleResponse(response)
            
                return
            }
            currentPage += 1
        }

        let response = service.getRestaurant(currentPage, limit: Constant.RecordPerPage)
        
        if (self.cancelled) {
            return
        }
        
        handleResponse(response)
    }
    
    // MARK: Private method
    
    private func handleResponse(response: Response<[Restaurant]>) {
        if response.data?.count > 0 {
            if currentPage <= 0 {
                model.lastSyncedAt = NSDate()
                
                model.add(response.data!, update: true)
                
                model.optimize()
            }
            
            post(Restaurant.Update, object: response.data!)
        }
        
        if let hasError = response.error {
            post(Restaurant.Error, object: hasError)
        }
    }
    
}
