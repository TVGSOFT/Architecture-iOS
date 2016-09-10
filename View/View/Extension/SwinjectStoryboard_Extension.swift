//
//  SwinjectStoryboard_Extension.swift
//  View
//
//  Created by Giáp Trần on 9/8/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import Swinject
import Model
import ViewModel
import RealmSwift

extension SwinjectStoryboard {
    
    // MARK: Setup instance
    
    public static func setup() {
        registerService()
        
        registerModel()
        
        registerViewModel()
        
        registerStoryboard()
    }
    
    // MARK: Register service
    
    private static func registerService() {
        defaultContainer.register(ApiHelper.self) { _ in
            ApiHelper(url: .Dev)
        }
        
        defaultContainer.register(AuthenticateService.self) { container in
            AuthenticateServiceImpl(apiHelper: container.resolve(ApiHelper.self)!)
        }
        
        defaultContainer.register(ClientService.self) { container in
            ClientServiceImpl(apiHelper: container.resolve(ApiHelper.self)!)
        }
    }
    
    // MARK: Register Model
    
    private static func registerModel() {
        defaultContainer.register(Realm.self) { _ in
            try! Realm()
        }
        
        defaultContainer.register(RestaurantModel.self) { container in
            RestaurantModel(realm: container.resolve(Realm.self)!)
        }
        
        defaultContainer.register(CommentModel.self) { container in
            CommentModel(realm: container.resolve(Realm.self)!)
        }
        
        defaultContainer.register(FoodModel.self) { container in
            FoodModel(realm: container.resolve(Realm.self)!)
        }
        
        defaultContainer.register(CategoryModel.self) { container in
            CategoryModel(realm: container.resolve(Realm.self)!)
        }
    }
    
    // MARK: Register ViewModel
    
    private static func registerViewModel() {
        let navigator = NavigatorImpl()
        navigator.configure(.SignIn, view: NSStringFromClass(SignInViewController.self))
        
        defaultContainer.register(Navigator.self) { _ in
            navigator
        }
        
        defaultContainer.register(SignInViewModel.self) { container in
            SignInViewModel(
                navigator: container.resolve(Navigator.self)!,
                service: container.resolve(ClientService.self)!,
                model: container.resolve(RestaurantModel.self)!
            )
        }
        
    }
    
    // MARK: Register storyboard
    
    private static func registerStoryboard() {
        defaultContainer.registerForStoryboard(SignInViewController.self) { container, controller in
            controller.viewModel = container.resolve(SignInViewModel.self)!
        }
    }
    
}