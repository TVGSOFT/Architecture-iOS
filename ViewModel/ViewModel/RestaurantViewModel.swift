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
    
    private var restaurants: Variable<[Restaurant]>?
    
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
        
        self.restaurants = Variable<[Restaurant]>([Restaurant]())
        
        let job = FetchRestaurantJob(service: service, model: model, priority: .Normal)
        jobManager.addOperation(job)
        
        register(Restaurant.Replace) { [unowned self] (object) in
            if let data = object as? [Restaurant] {
                self.restaurants?.value.removeAll()
                
                for item in data {
                    self.restaurants?.value.append(item)
                }
            }
        }
        register(Restaurant.Update) { [unowned self] (object) in
            if let data = object as? [Restaurant] {
                self.restaurants?.value.removeAll()
                
                for item in data {
                    self.restaurants?.value.append(item)
                }
            }
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
        
        restaurants = nil
    }
    
    // MARK: Command
    
    public func showSignInCommand() {
        navigator.showView(ViewKey.SignIn)
        
    }
    
}
