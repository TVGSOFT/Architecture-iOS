//
//  SignInViewModel.swift
//  ViewModel
//
//  Created by Giáp Trần on 9/7/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import Model
import RxSwift

public class SignInViewModel: ViewModel {
    
    // MARK: Property
    
    private let service: ClientService
    private let model: RestaurantModel
    
    public let email = Variable<String>("")
    public let password = Variable<String>("")
    
    // MARK: Constructor
    
    public init(navigator: Navigator, service: ClientService, model: RestaurantModel) {
        self.service = service
        self.model = model
        
        super.init(navigator: navigator)
    }
    
    // MARK: Lifecycle
    
    public override func didLoad() {
        super.didLoad()
        
    }
    
    public override func willAppear() {
        super.willAppear()
    }
    
    public override func willDisappear() {
        super.willDisappear()
    }
    
    public override func destroy() {
        super.destroy()
    }
    
    // MARK: Command
    
    public func signInCommand() {
        post(ViewKey.SignIn.rawValue, object: nil)
    }
    
    public func signUpCommand() {
        
    }
    
}
