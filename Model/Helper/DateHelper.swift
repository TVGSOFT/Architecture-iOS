//
//  DateHelper.swift
//  Model
//
//  Created by Giáp Trần on 9/4/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

public class DateHelper {
    
    // MARK: Property
    
    private static var internalJsonDateFormatter: NSDateFormatter?
    private static var internalJsonDateTimeFormatter: NSDateFormatter?

    public static var dateFormatter: NSDateFormatter {
        if (internalJsonDateFormatter == nil) {
            internalJsonDateFormatter = NSDateFormatter()
            internalJsonDateFormatter!.dateFormat = "yyyy-MM-dd HH:mm:ss"
        }
        return internalJsonDateFormatter!
    }
    
    public static var dateTimeFormatter: NSDateFormatter {
        if (internalJsonDateTimeFormatter == nil) {
            internalJsonDateTimeFormatter = NSDateFormatter()
            internalJsonDateTimeFormatter!.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSS'Z'"
        }
        return internalJsonDateTimeFormatter!
    }
    
    // MARK: Constructor
    
    private init() {
        
    }
    
}