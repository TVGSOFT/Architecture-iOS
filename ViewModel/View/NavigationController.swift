//
//  NavigationController.swift
//  App
//
//  Created by Giáp Trần on 8/17/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import UIKit

public class NavigationController: UINavigationController {

    public override func shouldAutorotate() -> Bool {
        return UIApplication.currentViewController!.shouldAutorotate()
    }
    
    public override func prefersStatusBarHidden() -> Bool {
        return UIApplication.currentViewController!.prefersStatusBarHidden()
    }
    
    public override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIApplication.currentViewController!.preferredStatusBarStyle()
    }
    
    public override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIApplication.currentViewController!.supportedInterfaceOrientations()
    }
    
    public override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return UIApplication.currentViewController!.preferredInterfaceOrientationForPresentation()
    }
    
}
