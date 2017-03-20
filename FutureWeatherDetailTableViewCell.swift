//
//  FutureWeatherDetailTableViewCell.swift
//  YetAnotherWeatherApp
//
//  Created by Joe Riess on 3/19/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import UIKit

import SnapKit

final class FutureWeatherDetailTableViewCell: UITableViewCell {
    
    private let dayLabel: UILabel = {
        $0.text = "TUE"
        $0.textAlignment = .right
        $0.font = UIFont(name: "HelveticaNeue", size: 14)
        $0.textColor = UIColor(red: 0.44, green: 0.44, blue: 0.44, alpha: 1.00)
        return $0
    }(UILabel())
    
    private let weatherImageView: UIImageView = {
        $0.image = #imageLiteral(resourceName: "Screen Shot 2017-03-19 at 3.58.23 PM")
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    private let highLowTemperatureLabel: UILabel = {
        $0.text = "22 / 30"
        $0.font = UIFont(name: "HelveticaNeue", size: 14)
        $0.textColor = UIColor(red: 0.44, green: 0.44, blue: 0.44, alpha: 1.00)
        return $0
    }(UILabel())
    
    private let stackView: UIStackView = {
        $0.distribution = .fillEqually
        $0.spacing = 3.0
        return $0
    }(UIStackView())
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        backgroundColor = UIColor(red:0.16, green:0.16, blue:0.16, alpha:1.00)
        
        addSubview(stackView)
        
        stackView.addArrangedSubview(dayLabel)
        stackView.addArrangedSubview(weatherImageView)
        stackView.addArrangedSubview(highLowTemperatureLabel)
        
        stackView.snp.makeConstraints() { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.size.equalToSuperview().multipliedBy(0.5)
        }
    }
    
    func configure(weatherData: WeatherData) {
        dayLabel.text = weatherData.day
        highLowTemperatureLabel.text = "\(weatherData.temperature.high)º / \(weatherData.temperature.low)"
    }
}
