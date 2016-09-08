//
//  INavigator.swift
//  Core
//
//  Created by Giáp Trần on 8/17/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import Foundation

public protocol Navigator {
    
    var currentViewKey: ViewKey { get }
    
    func goBack()
    
    func showView(key: ViewKey)
    
    func showView(key: ViewKey, params: NSObject?)
    
    func showAlert(title: String,
                   message: String,
                   negativeTitle: String,
                   negativeHandler: ((UIAlertAction) -> Void)?)
    
    func showAlert(title: String,
                   message: String,
                   negativeTitle: String,
                   negativeHandler: ((UIAlertAction) -> Void)?,
                   positiveTitle: String,
                   positiveHandler: ((UIAlertAction) -> Void)?)
    
}