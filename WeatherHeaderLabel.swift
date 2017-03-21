//
//  WeatherHeaderLabel.swift
//  YetAnotherWeatherApp
//
//  Created by Joe Riess on 3/20/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import UIKit

final class WeatherHeaderLabel: UILabel {
    
    enum `Type` {
        case temperature, location
    }
    
    /// Type of label to draw
    private var type: Type = .location
    
    init(type: Type) {
        super.init(frame: .zero)
        
        self.type = type
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        
        textAlignment = .center
        numberOfLines = 0
        
        if type == .temperature {
            textColor = .headerGray
            font = UIFont(name: "HelveticaNeue", size: 300)
        } else {
            textColor = .subHeaderGray
            font = UIFont(name: "HelveticaNeue", size: 20)
        }
    }
    
}
