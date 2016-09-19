//
//  ViewController.swift
//  App
//
//  Created by Giáp Trần on 8/17/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import UIKit
import RxSwift

public class ViewController: UIViewController {

    // MARK: Property
    
    public var disposeBag = DisposeBag()
    
    public var viewModelDelegate: ViewModelDelegate? {
        return nil
    }
    
    // MARK: Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModelDelegate?.didLoad()
    }
    
    public override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModelDelegate?.willAppear()
    }
    
    public override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        viewModelDelegate?.willDisappear()
    }
    
    public override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        if (isBeingDismissed()) {
            destroy()
        }
    }
    
    deinit {
        print("\(NSStringFromClass(self.dynamicType)) deinit.")
    }
    
    // MARK: Override method
    
    public override func shouldAutorotate() -> Bool {
        return true
    }
    
    public override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    public override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    public override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .All
    }
    
    public override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return UIApplication.sharedApplication().statusBarOrientation
    }
    
    public override func willMoveToParentViewController(parent: UIViewController?) {
        super.willMoveToParentViewController(parent)
        
        guard let _ = parent else {
            destroy()
            
            return
        }
    }
    
    public override func isBeingDismissed() -> Bool {
        return navigationController?.isBeingDismissed() ?? super.isBeingDismissed()
    }
    
    // MARK: Public method
    
    public func destroy() {
        viewModelDelegate?.destroy()
    }

}