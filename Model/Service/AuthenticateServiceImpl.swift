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
    
    public func signIn(email: String,
                       password: String,
                       successHandler: (User) -> Void,
                       failureHandler: (NSError) -> Void) {
        
        let parameters = [ "email"      : email,
                           "password"   : password ]
        
        self.apiHelper
            .post(.SignIn, parameters: parameters) { (json, error) in
         
                self.handleJson(json,
                                error: error,
                                successHandler: successHandler,
                                failureHandler: failureHandler)
        }
    }
    
    public func signUp(email: String,
                       password: String,
                       name: String,
                       successHandler: (User) -> Void,
                       failureHandler: (NSError) -> Void) {
        
        let parameters = [ "email"      : email,
                           "password"   : password,
                           "name"       : name ]
        
        self.apiHelper
            .post(.SignUp, parameters: parameters) { (json, error) in
                
               self.handleJson(json,
                               error: error,
                               successHandler: successHandler,
                               failureHandler: failureHandler)
        }
    }
    
    // MARK - Private method
    
    private func handleJson(json: JSON?,
                            error: NSError?,
                            successHandler: (User) -> Void,
                            failureHandler: (NSError) -> Void) {
        
        if let hasJon = json {
            let response = Response<User>()
            response.from(hasJon)
            
            if response.isSuccess {
                User.from(hasJon["data"], output: &response.data)
                
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