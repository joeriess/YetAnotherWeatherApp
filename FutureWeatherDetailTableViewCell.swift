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
        $0.text = "22"
        return $0
    }(UILabel())
    
    private let weatherImageView: UIImageView = {
        return $0
    }(UIImageView())
    
    private let highLowTemperatureLabel: UILabel = {
        $0.text = "22 / 30"
        return $0
    }(UILabel())
    
    private let stackView: UIStackView = {
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
        
        addSubview(stackView)
        
        stackView.addArrangedSubview(dayLabel)
        stackView.addArrangedSubview(weatherImageView)
        stackView.addArrangedSubview(highLowTemperatureLabel)
        
        stackView.snp.makeConstraints() { make in
            make.size.equalToSuperview()
        }
    }
}
