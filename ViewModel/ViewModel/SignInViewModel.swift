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
    
    // MARK: Command
    
    public func signInCommand() {
        service.getRestaurant(
            0,
            lastSync: model.lastSyncedAt,
            offet: 0,
            limit: 20,
            successHandler: { [weak self] restaurants in
            
                self?.model.add(restaurants, update: true)
                
                let tmp = self?.model.getLastest()
                
            },
            failureHandler: { [weak self] error in
        
                self?.navigator
                     .showAlert(
                        "Error",
                        message: error.localizedDescription,
                        negativeTitle: "OK",
                        negativeHandler: nil
                )
                
            })
    }
    
}