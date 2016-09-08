//
//  AuthenticateService.swift
//  Model
//
//  Created by Giáp Trần on 9/1/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

public protocol AuthenticateService {
    
    func signIn(email: String,
                password: String,
                successHandler: (User) -> Void,
                failureHandler: (NSError) -> Void)
    
    func signUp(email: String,
                password: String,
                name: String,
                successHandler: (User) -> Void,
                failureHandler: (NSError) -> Void)
    
}