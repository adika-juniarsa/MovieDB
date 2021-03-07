//
//  String+Date.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//

import Foundation

extension String {
    
    func convertDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: self) ?? Date()
    }
    
    func convertReviewDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss. SSS'Z'"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: self) ?? Date()
    }
}
