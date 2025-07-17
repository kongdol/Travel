//
//  CityDetailViewController.swift
//  Travel
//
//  Created by yk on 7/17/25.
//

import UIKit

class CityDetailViewController: UIViewController {

    @IBOutlet var cityName: UILabel!

    var city = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cityName.text = city
        
    }
    

    

}
