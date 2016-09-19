//
//  BaseViewModel.swift
//  Core
//
//  Created by Giáp Trần on 8/17/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import Foundation
import RxSwift
import Model

public protocol ViewModelDelegate {
    
    func didLoad()
    
    func willAppear()
    
    func willDisappear()
 
    func destroy()
    
}

public class ViewModel: ViewModelDelegate {
    
    // MARK: Property
    
    let disposeBag = DisposeBag()
    
    let navigator: Navigator
    
    // MARK: Constructor
    
    public init(navigator: Navigator) {
        self.navigator = navigator
    }
    
    // MARK: IViewModelLifecycle implement
    
    public func didLoad() {
        
    }
    
    public func willAppear() {
        
    }
    
    public func willDisappear() {
        
    }
    
    public func destroy() {
        
    }
    
    // MARK: Internal method
    
    internal func register(name: String, handler: (AnyObject?) -> Void) {
        EventBus.sharedManager
                .register(name, handler: handler)
    }
    
    internal func unregister(name: String) {
        EventBus.sharedManager
                .unregister(name)
    }
    
    internal func post(name: String, object: AnyObject) {
        EventBus.sharedManager
                .post(name, object: object)
    }
    
    internal func postSticky(name: String, object: AnyObject) {
        EventBus.sharedManager
                .postSticky(name, object: object)
    }
    
}