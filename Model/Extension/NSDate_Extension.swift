//
//  NSDate_Extension.swift
//  Model
//
//  Created by Giáp Trần on 9/10/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import Foundation

extension NSDate {
    
    public var Utc: NSDate {
        let dateString = DateHelper.utcDateFormatter.stringFromDate(self)
        return DateHelper.utcDateFormatter.dateFromString(dateString)!
    }
    
    public var Local: NSDate {
        let dateString = DateHelper.localDateFormatter.stringFromDate(self)
        return DateHelper.localDateFormatter.dateFromString(dateString)!
    }
    
}