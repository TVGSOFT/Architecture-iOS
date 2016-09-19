//
//  EventPost.swift
//  Model
//
//  Created by Giáp Trần on 9/19/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import UIKit

class EventPost {

    // MARK: Property
    
    var object: AnyObject?
    var observer: NSObjectProtocol?
    var handler: ((AnyObject?) -> Void)?
    var isActive: Bool = false
    
    // MARK: Internal method

    func send() {
        handler?(object)
    }
    
}
