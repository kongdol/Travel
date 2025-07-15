//
//  CityTableViewController.swift
//  Travel
//
//  Created by yk on 7/15/25.
//

import UIKit

let cityInfo = CityInfo()

class CityTableViewController: UITableViewController {

    let identifier = CityTableViewCell.identifier
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibName = UINib(nibName: identifier, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: identifier)
    }

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityInfo.city.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! CityTableViewCell
        
        cell.cityName.text = cityInfo.city[indexPath.row].city_name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    

}
