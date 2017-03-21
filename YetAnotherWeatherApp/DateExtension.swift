//
//  DateExtension.swift
//  YetAnotherWeatherApp
//
//  Created by Joe Riess on 3/20/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import Foundation

extension Date {
    
    var day: String {
        let weekDay = Calendar.current.component(.weekday, from: self)
        return DateFormatter().weekdaySymbols[weekDay]
    }
    
    var hour: String {
        return "\(Calendar.current.component(.hour, from: self))"
    }
}
