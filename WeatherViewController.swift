//
//  WeatherViewController.swift
//  YetAnotherWeatherApp
//
//  Created by Joe Riess on 3/16/17.
//  Copyright © 2017 Joe Riess. All rights reserved.
//

import UIKit
import SnapKit

final class WeatherViewController: UIViewController {
    
    // MARK: - Variables + Constants
    
    // MARK: - Views
    
    private let headerView: UIView = {
        $0.backgroundColor = .red
        return $0
    }(UIView())
    
    private let timeCityContainer: UIView = {
        
        return $0
    }(UIView())
    
    private let dateTimeLabel: UILabel = {
        
        return $0
    }(UILabel())
    
    private let cityLabel: UILabel = {
        
        return $0
    }(UILabel())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(headerView)
        
        headerView.snp.makeConstraints() { make in
            make.top.equalTo(self.view.snp.topMargin)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.height.equalTo(self.view.frame.size.height / 2)
        }
    }
}
