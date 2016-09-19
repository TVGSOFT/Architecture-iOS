//
//  JobManager.swift
//  Model
//
//  Created by Giáp Trần on 9/8/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

public class JobManager: NSOperationQueue {

    // MARK: Constructor
    
    public init(name: String, maxConcurrentOperationCount: Int) {
        super.init()
        
        self.name = name
        self.maxConcurrentOperationCount = maxConcurrentOperationCount
    }
    
}
