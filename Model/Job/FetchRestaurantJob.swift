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
    
    // MARK: Constructor
    
    public init(service: ClientService, model: RestaurantModel, priority: NSOperationQueuePriority) {
        self.service = service
        self.model = model
        
        super.init(priority: priority)
    }
    
    // MARK: Override method
    
    public override func main() {
        
    }
    
}
