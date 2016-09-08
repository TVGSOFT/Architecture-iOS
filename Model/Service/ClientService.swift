//
//  ClientService.swift
//  Model
//
//  Created by Giáp Trần on 9/1/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

public protocol ClientService {
    
    func getRestaurant(categoryId: Int,
                       lastSync: Double,
                       offet: Int,
                       limit: Int,
                       successHandler: ([Restaurant]) -> Void,
                       failureHandler: (NSError) -> Void)
    
    func getCategory(lastSync: Double,
                     offet: Int,
                     limit: Int,
                     successHandler: ([Category]) -> Void,
                     failureHandler: (NSError) -> Void)
    
}