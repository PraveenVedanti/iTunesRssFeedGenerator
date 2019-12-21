//
//  ViewController.swift
//  iTunesRssFeedGenerator
//
//  Created by Praveen on 12/18/19.
//  Copyright © 2019 Praveen. All rights reserved.
//

import UIKit

protocol ChangeCountry : class {
    func getCountry(name:String)
}

class ViewController: UIViewController {
    
    var countrySelectionButton = UIBarButtonItem()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
    
        countrySelectionButton = UIBarButtonItem(title: "USA", style: .plain, target: self, action: #selector(changeCountry))
        navigationItem.rightBarButtonItem = countrySelectionButton
    }
    
    @objc func changeCountry() {
        
        let countryListViewController = CountrySelectionViewController()
        countryListViewController.delegate = self
        let countryListNavigationController = UINavigationController(rootViewController: countryListViewController)
        present(countryListNavigationController, animated: true, completion: nil)
    }
}

extension ViewController :ChangeCountry {
    func getCountry(name: String) {
        countrySelectionButton.title = name
    }
}
