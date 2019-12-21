//
//  CountrySelectionViewController.swift
//  iTunesRssFeedGenerator
//
//  Created by Praveen on 12/20/19.
//  Copyright © 2019 Praveen. All rights reserved.
//

import UIKit

class CountrySelectionViewController: UIViewController {
    
    var countryListTableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CountryCell")
        return tableView
    }()
    
    var countriesList = ["USA", "UK", "Australia", "India", "Brazil"]
    weak var delegate:ChangeCountry?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Choose Country"
        view.backgroundColor = .white
        setCountrtTableView()
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissViewController))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    fileprivate func setCountrtTableView () {
        view.addSubview(countryListTableView)
        countryListTableView.dataSource = self
        countryListTableView.delegate = self
        NSLayoutConstraint.activate([
            countryListTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            countryListTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            countryListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            countryListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    @objc func dismissViewController() {
        self.dismiss(animated: true)
    }
}


extension CountrySelectionViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let countryNameCell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath)
        let countryName = countriesList[indexPath.row]
        countryNameCell.selectionStyle = .none
        countryNameCell.textLabel?.text = countryName
        return countryNameCell
    }
}

extension CountrySelectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let countryName = countriesList[indexPath.row]
        delegate?.getCountry(name: countryName)
        dismissViewController()
    }
}
