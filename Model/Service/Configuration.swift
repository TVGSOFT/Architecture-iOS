//
//  Configuration.swift
//  Core
//
//  Created by Giáp Trần on 8/26/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

public enum Server: String {
    
    case Url = "http://167.88.124.80/foody_api/"
    
}

public enum Function: String {
    
    case GetRestaurant = "/api/v1/restaurants"
    
    case GetCategory = "/api/v1/categories"

    case SignIn = "/api/v1/authenticate/sign-in"

    case SignUp = "/api/v1/authenticate/sign-up"

}