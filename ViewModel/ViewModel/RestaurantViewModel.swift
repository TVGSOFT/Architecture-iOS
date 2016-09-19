//
//  RestaurantViewModel.swift
//  ViewModel
//
//  Created by Giáp Trần on 9/17/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import Model
import RxSwift

public class RestaurantViewModel: ViewModel {

    // MARK: Property
    
    private let service: ClientService
    private let model: RestaurantModel
    private let jobManager: JobManager
    
    // MARK: Constructor
    
    public init(navigator: Navigator, service: ClientService, model: RestaurantModel, jobManager: JobManager) {
        self.service = service
        self.model = model
        self.jobManager = jobManager
        
        super.init(navigator: navigator)
    }
    
    // MARK: Lifecycle
    
    public override func didLoad() {
        super.didLoad()
        
        register(Restaurant.Replace) { [unowned self] (object) in
            
        }
        register(Restaurant.Update) { [unowned self] (object) in
            
        }
    }
    
    public override func willAppear() {
        super.willAppear()
    }
    
    public override func willDisappear() {
        super.willDisappear()
    }
    
    public override func destroy() {
        super.destroy()
        
        unregister(Restaurant.Replace)
        unregister(Restaurant.Update)
    }
    
    // MARK: Command
    
    public func showSignInCommand() {
        navigator.showView(ViewKey.SignIn)
        
    }
    
}
