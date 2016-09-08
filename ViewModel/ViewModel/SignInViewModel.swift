//
//  SignInViewModel.swift
//  ViewModel
//
//  Created by Giáp Trần on 9/7/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import Foundation
import RxSwift

public class SignInViewModel: ViewModel {
    
    // MARK: Property
    
    public let email = Variable<String>("")
    public let password = Variable<String>("")
    
    // MARK: Constructor
    
    public override init(navigator: Navigator) {
        super.init(navigator: navigator)
        
        email.value = "Hello"
    }
    
    // MARK: Command
    
    public func signInCommand() {
        
    }
    
}