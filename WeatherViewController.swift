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
    
    private let timeCityLabel: UILabel = {
        
        return $0
    }(UILabel())
    
    private let nowTemperatureLabel: UILabel = {
        
        return $0
    }(UILabel())
    
    private let headerStackView: UIStackView = {

        return $0
    }(UIStackView())
    
    private let headerBackgroundImageView: UIImageView = {
        $0.image = #imageLiteral(resourceName: "TGaZIQ")
        return $0
    }(UIImageView())
    
    private lazy var detailTableView: UITableView = {
        
        $0.delegate = self
        $0.dataSource = self
        
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return $0
    }(UITableView())
    
    // MARK: - Presenter
    
    fileprivate var viewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fakeViewModel = WeatherViewModel(temperature: (current: "25", high: "30", low: "20"),
                                             city: "Berlin",
                                             humidity: "5",
                                             description: "Cold",
                                             timeFetched: "MON, 11AM")
        viewModel = fakeViewModel
        
        view.addSubview(headerView)
        headerView.addSubview(headerBackgroundImageView)
        view.addSubview(detailTableView)
        
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}
