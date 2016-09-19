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
        let container = defaultContainer
        
        container.register(JobManager.self) { _ in
            JobManager(name: "com.tvgsoft.JobManager", maxConcurrentOperationCount: 4)
        }
        
        container.register(ApiHelper.self) { _ in
            ApiHelper(url: .Dev)
        }
        
        container.register(AuthenticateService.self) { container in
            AuthenticateServiceImpl(apiHelper: container.resolve(ApiHelper.self)!)
        }
        
        container.register(ClientService.self) { container in
            ClientServiceImpl(apiHelper: container.resolve(ApiHelper.self)!)
        }
    }
    
    // MARK: Register Model
    
    private static func registerModel() {
        let container = defaultContainer
        
        container.register(RestaurantModel.self) { _ in
            RestaurantModel()
        }
        
        container.register(CommentModel.self) { _ in
            CommentModel()
        }
        
        container.register(FoodModel.self) { _ in
            FoodModel()
        }
        
        container.register(CategoryModel.self) { _ in
            CategoryModel()
        }
    }
    
    // MARK: Register ViewModel
    
    private static func registerViewModel() {
        let container = defaultContainer
        
        container.register(Navigator.self) { _ in
            let navigator = NavigatorImpl()
            navigator.configure(.SignIn, view: NSStringFromClass(SignInViewController.self))
            
            return navigator
        }
        
        container.register(SignInViewModel.self) { container in
            SignInViewModel(
                navigator: container.resolve(Navigator.self)!,
                service: container.resolve(ClientService.self)!,
                model: container.resolve(RestaurantModel.self)!
            )
        }
        
        container.register(RestaurantViewModel.self) { container in
            RestaurantViewModel(
                navigator: container.resolve(Navigator.self)!,
                service: container.resolve(ClientService.self)!,
                model: container.resolve(RestaurantModel.self)!,
                jobManager: container.resolve(JobManager.self)!
            )
        }
    }
    
    // MARK: Register storyboard
    
    private static func registerStoryboard() {
        let container = defaultContainer
        
        container.registerForStoryboard(SignInViewController.self) { container, controller in
            controller.viewModel = container.resolve(SignInViewModel.self)!
        }
        
        container.registerForStoryboard(RestaurantViewController.self) { container, controller in
            controller.viewModel = container.resolve(RestaurantViewModel.self)!
        }
    }
    
}