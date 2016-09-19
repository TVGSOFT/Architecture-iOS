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
        return topViewController!.shouldAutorotate()
    }
    
    public override func prefersStatusBarHidden() -> Bool {
        return topViewController!.prefersStatusBarHidden()
    }
    
    public override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return topViewController!.preferredStatusBarStyle()
    }
    
    public override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return topViewController!.supportedInterfaceOrientations()
    }
    
    public override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return topViewController!.preferredInterfaceOrientationForPresentation()
    }
    
}
