//
//  Int64+Date.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//

import Foundation

extension Int64 {
    
    func timestampToString() -> String {
        let dateTimeStamp = NSDate(timeIntervalSince1970: Double(self) / 1000)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.local
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: dateTimeStamp as Date)
    }
}
