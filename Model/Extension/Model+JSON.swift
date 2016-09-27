//
//  JSON_Extension.swift
//  Model
//
//  Created by Giáp Trần on 9/4/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import Foundation
import SwiftyJSON

extension JSON {
    
    public var date: NSDate? {
        switch self.type {
        case .String:
            return DateHelper.localDateFormatter.dateFromString(self.object as! String)
        default:
            return nil
        }
    }
    
    public var dateTime: NSDate? {
        switch self.type {
        case .String:
            return DateHelper.localDateTimeFormatter.dateFromString(self.object as! String)
        default:
            return nil
        }
    }
    
}