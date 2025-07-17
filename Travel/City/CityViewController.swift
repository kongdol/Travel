//
//  RealCityViewController.swift
//  Travel
//
//  Created by yk on 7/17/25.
//

import UIKit

class CityViewController: UIViewController {

    @IBOutlet var segement: UISegmentedControl!
    @IBOutlet var textField: UITextField!
    @IBOutlet var cityTableView: UITableView!
    
    let list = CityInfo().city
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        configureTableView()

    }
    
    func configureTableView() {
        print(#function)
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        cityTableView.backgroundColor = .clear
        
        cityTableView.rowHeight = 200
        
        let xib = UINib(nibName: "CityTableViewCell", bundle: nil)
        cityTableView.register(xib, forCellReuseIdentifier: "CityTableViewCell")
    }
    


}

extension CityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
        
        let row = list[indexPath.row]
        
        cell.backgroundColor = .clear
        
        cell.cityName.text = row.city_name + " | " + row.city_english_name
        cell.cityName.textColor = .white
        cell.cityName.font = UIFont.boldSystemFont(ofSize: 20)
        
        cell.cityExplain.text = row.city_explain
        cell.cityExplain.textColor = .white
        cell.cityExplain.backgroundColor = .black.withAlphaComponent(0.5)
        
        
        // 여행이미지
        let img = list[indexPath.row].city_image
        let url = URL(string: img)
        cell.cityImage.kf.setImage(with: url)
        cell.cityImage.layer.cornerRadius = 16
        cell.cityImage.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "CityDetailViewController") as! CityDetailViewController
        vc.city = list[indexPath.row].city_name
        
        present(vc, animated: true)
    }
    
    
}
