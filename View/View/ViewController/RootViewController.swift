//
//  RootViewController.swift
//  View
//
//  Created by Giáp Trần on 9/20/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import UIKit
import ViewModel
import Material

class RootViewController: ViewController {

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let restaurantViewController = storyboard!.instantiateViewControllerWithIdentifier("RestaurantNavigationController")
        let menuViewController = storyboard!.instantiateViewControllerWithIdentifier("MenuViewController")
        
        let drawerViewController = NavigationDrawerController(
            rootViewController: restaurantViewController,
            leftViewController: menuViewController,
            rightViewController: nil
        )
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.window?.rootViewController = drawerViewController
    }

}