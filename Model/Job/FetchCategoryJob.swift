//
//  FetchCategoryJob.swift
//  Model
//
//  Created by Giáp Trần on 9/19/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//


public class FetchCategoryJob: BaseJob {

    // MARK: Property
    
    private let service: ClientService
    private let model: CategoryModel
    
    // MARK: Constructor
    
    public init(service: ClientService, model: CategoryModel, priority: NSOperationQueuePriority) {
        self.service = service
        self.model = model
        
        super.init(priority: priority)
    }
    
    // MARK: Override method
    
    public override func main() {
        if let categories = model.getCategory() {
            post(Category.Replace, object: categories)
        }
        
        var response: Response<[Category]>
        
        if let lastSyncedAt = model.lastSyncedAt {
            response = service.getCategory(lastSyncedAt)
        } else {
            response = service.getCategory()
        }
        
        if (self.cancelled) {
            return
        }
        
        handleResponse(response)
    }
    
    // MARK: Private method
    
    private func handleResponse(response: Response<[Category]>) {
        if response.data?.count > 0 {
            model.lastSyncedAt = NSDate()
            
            model.add(response.data!, update: true)
            
            post(Category.Replace, object: response.data!)
        }
        
        if let hasError = response.error {
            post(Category.Error, object: hasError)
        }
    }
    
}

