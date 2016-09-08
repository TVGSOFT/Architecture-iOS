//
//  Navigator.swift
//  Core
//
//  Created by Giáp Trần on 8/17/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import Foundation

public class NavigatorImpl: Navigator {
    
    // MARK: Property
    
    private var pages = [ViewKey: String]()
    
    // MARK: Public method
    
    public func configure(key: ViewKey, view: String) {
        pages[key] = view
    }
    
    // MARK: INavigator implement
    
    public var currentViewKey: ViewKey {
        if let viewController = UIApplication.currentViewController {
            let key = pages.filter({ $1 == NSStringFromClass(viewController.dynamicType) })
                           .first
            
            return key?.0 ?? .Unknow
        }
        
        return .Root
    }
    
    public func goBack() {
        var viewController = UIApplication.currentViewController
        
        if let navigateController = viewController as? UINavigationController {
            navigateController.popViewControllerAnimated(true)
        } else {
            viewController?.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    public func showView(key: ViewKey) {
        showView(key, params: nil)
    }
    
    public func showView(key: ViewKey, params: NSObject?) {
        UIApplication.currentViewController?
                     .performSegueWithIdentifier(key.rawValue, sender: params)
    }
    
    public func showAlert(title: String,
                          message: String,
                          negativeTitle: String,
                          negativeHandler: ((UIAlertAction) -> Void)?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        alertController.addAction(UIAlertAction(title: negativeTitle, style: .Cancel, handler: negativeHandler))
        
        UIApplication.currentViewController?
                     .showDetailViewController(alertController, sender: nil)
    }
    
    public func showAlert(title: String,
                          message: String,
                          negativeTitle: String,
                          negativeHandler: ((UIAlertAction) -> Void)?,
                          positiveTitle: String,
                          positiveHandler: ((UIAlertAction) -> Void)?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        alertController.addAction(UIAlertAction(title: negativeTitle, style: .Cancel, handler: negativeHandler))
        alertController.addAction(UIAlertAction(title: positiveTitle, style: .Default, handler: positiveHandler))
        
        UIApplication.currentViewController?
                     .showDetailViewController(alertController, sender: nil)
    }
    
}

// MARK: UIApplication extension

extension UIApplication {
    
    public class var currentViewController: UIViewController? {
        var parentViewController = UIApplication.sharedApplication()
                                                .keyWindow?
                                                .rootViewController
        
        while let viewController = parentViewController?.presentedViewController {
            parentViewController = viewController
        }
        
        if let nagvigationController = parentViewController as? UINavigationController {
            return nagvigationController.topViewController;
        }
        
        return parentViewController
    }
    
}