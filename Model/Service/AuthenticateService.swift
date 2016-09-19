//
//  AuthenticateService.swift
//  Model
//
//  Created by Giáp Trần on 9/1/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

public protocol AuthenticateService {
    
    func signIn(email: String, password: String, completionHandler: (Response<User>) -> Void)
    
    func signUp(email: String, password: String, name: String, completionHandler: (Response<User>) -> Void)
    
}