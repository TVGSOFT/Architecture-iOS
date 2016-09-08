//
//  BaseJob.swift
//  Model
//
//  Created by Giáp Trần on 9/8/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

public class BaseJob: NSOperation {

    // MARK: Constructor
    
    public init(priority: NSOperationQueuePriority) {
        super.init()
        
        self.queuePriority = priority
    }
    
}
