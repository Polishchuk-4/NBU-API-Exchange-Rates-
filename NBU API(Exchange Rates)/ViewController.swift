//
//  ViewController.swift
//  NBU API(Exchange Rates)
//
//  Created by Denys Polishchuk on 19.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.settingNavBar()
    }
    
    private func settingNavBar() {
        self.navigationController?.navigationBar.backgroundColor = .green
        self.navigationItem.title = "NBU API"
        self.navigationItem.titleView?.tintColor = .white
    }
}
