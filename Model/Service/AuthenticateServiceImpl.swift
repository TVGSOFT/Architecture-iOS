//
//  AuthenticateServiceImpl.swift
//  Model
//
//  Created by Giáp Trần on 9/1/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import SwiftyJSON

public class AuthenticateServiceImpl: Service, AuthenticateService {
    
    // MARK: AuthenticateService implement
    
    public func signIn(email: String, password: String, completionHandler: (Response<User>) -> Void) {
        let parameters = [ "email"      : email,
                           "password"   : password ]
        
        apiHelper.post(.SignIn, parameters: parameters) { [unowned self] (json, error) in
            
            self.handleJson(
                json,
                error: error,
                completionHandler: completionHandler
            )
        }
    }
    
    public func signUp(email: String, password: String, name: String, completionHandler: (Response<User>) -> Void) {
        let parameters = [ "email"      : email,
                           "password"   : password,
                           "name"       : name ]
        
        apiHelper.post(.SignUp, parameters: parameters) { [unowned self] (json, error) in
            
            self.handleJson(
                json,
                error: error,
                completionHandler: completionHandler
            )
        }
    }
    
    // MARK - Private method
    
    private func handleJson(json: JSON?, error: NSError?, completionHandler: (Response<User>) -> Void) {
        let response = Response<User>()
        
        if let hasJon = json {
            response.fromJson(hasJon)
            
            if response.isSuccess {
                User.fromJson(hasJon["data"], output: &response.data)
            } else {
                response.error = NSError(domain: response.message!, code: 0, userInfo: nil)
            }
        }
        
        if let hasError = error {
            response.error = hasError
        }
        
        completionHandler(response)
    }
    
}