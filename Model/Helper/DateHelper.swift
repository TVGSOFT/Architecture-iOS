//
//  DateHelper.swift
//  Model
//
//  Created by Giáp Trần on 9/4/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

public class DateHelper {
    
    // MARK: Property
    
    private static var jsonLocalDateFormatter: NSDateFormatter?
    private static var jsonLocalDateTimeFormatter: NSDateFormatter?
    private static var jsonUtcDateFormatter: NSDateFormatter?
    
    public static var localDateFormatter: NSDateFormatter {
        if jsonLocalDateFormatter == nil {
            jsonLocalDateFormatter = NSDateFormatter()
            jsonLocalDateFormatter!.dateFormat = "yyyy-MM-dd HH:mm:ss"
        }
        return jsonLocalDateFormatter!
    }
    
    public static var localDateTimeFormatter: NSDateFormatter {
        if jsonLocalDateTimeFormatter == nil {
            jsonLocalDateTimeFormatter = NSDateFormatter()
            jsonLocalDateTimeFormatter!.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSS'Z'"
        }
        return jsonLocalDateTimeFormatter!
    }
    
    public static var utcDateFormatter: NSDateFormatter {
        if (jsonUtcDateFormatter == nil) {
            jsonUtcDateFormatter = NSDateFormatter()
            jsonUtcDateFormatter!.timeZone = NSTimeZone(name: "UTC")
            jsonUtcDateFormatter!.dateFormat = "yyyy-MM-dd HH:mm:ss"
        }
        return jsonUtcDateFormatter!
    }
    
    // MARK: Constructor
    
    private init() {
        
    }
    
}