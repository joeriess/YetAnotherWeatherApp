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
        $0.backgroundColor = UIColor(red:0.45, green:0.84, blue:0.84, alpha:1.00)
        return $0
    }(UIView())
    
    private let timeCityLabel: UILabel = {
        $0.textAlignment = .center
        $0.text = "Berlin"
        $0.backgroundColor = .red
        $0.textColor = .white
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private let nowTemperatureLabel: UILabel = {
        $0.textAlignment = .center
        $0.text = "22"
        $0.textColor = .white
        return $0
    }(UILabel())
    
    private let headerStackView: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        return $0
    }(UIStackView())
    
    private let headerBackgroundImageView: UIImageView = {
//        $0.image = #imageLiteral(resourceName: "TGaZIQ")
        return $0
    }(UIImageView())
    
    private lazy var detailTableView: UITableView = {
        
        $0.delegate = self
        $0.dataSource = self
        
        $0.register(FutureWeatherDetailTableViewCell.self,
                    forCellReuseIdentifier: "weather")
        
        return $0
    }(UITableView())
    
    private var didCreateConstraints = false
    
    // MARK: - Presenter
    
    fileprivate var viewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OpenWeatherMap().getWeather(for: "New%20", countryCode: "US") { weather in
            print(weather)
        }

        let fakeViewModel = WeatherViewModel(temperature: (current: "25", high: "30", low: "20"),
                                             city: "Berlin",
                                             humidity: "5",
                                             description: "Cold",
                                             timeFetched: "MON, 11AM")
        viewModel = fakeViewModel
        
        view.addSubview(headerView)
        headerView.addSubview(headerBackgroundImageView)
        
        view.addSubview(detailTableView)
        
        headerView.addSubview(headerStackView)
        headerStackView.addArrangedSubview(timeCityLabel)
        headerStackView.addArrangedSubview(nowTemperatureLabel)
        
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        
        if !didCreateConstraints {
            
            headerView.snp.makeConstraints() { make in
                make.size.equalToSuperview()
                make.height.equalToSuperview().multipliedBy(0.5)
            }
            
            headerBackgroundImageView.snp.makeConstraints() { make in
                make.size.equalToSuperview()
            }
            
            detailTableView.snp.makeConstraints() { make in
                make.size.equalToSuperview()
                make.top.equalTo(headerView.snp.bottom)
            }
            
            headerStackView.snp.makeConstraints() { make in
                make.size.equalToSuperview()
            }
            
            didCreateConstraints = true
        }
        
        
        super.updateViewConstraints()
    }
    
}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weather", for: indexPath)
        return cell
    }
}
