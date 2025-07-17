//
//  CityTableViewController.swift
//  Travel
//
//  Created by yk on 7/15/25.
//

import UIKit

let cityInfo = CityInfo()

class CityTableViewController: UITableViewController {

    
    @IBOutlet var segmentControl: UISegmentedControl!
    
    let identifier = CityTableViewCell.identifier
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibName = UINib(nibName: identifier, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: identifier)
        
        print(domesticCount())
    }
    
    // 셀갯수를 위한 국내도시 갯수 구하기위한 함수
    func domesticCount() -> Int {
        var count = 0
        for i in 0..<cityInfo.city.count {
            if cityInfo.city[i].domestic_travel == true {
                count = count + 1
                
            }
        }
        
        return count
    }
    
    // MARK: 테이블뷰 기본
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentControl.selectedSegmentIndex == 0 {
            return cityInfo.city.count
        } else if segmentControl.selectedSegmentIndex == 1 {
            return domesticCount()
        } else {
            return cityInfo.city.count - domesticCount()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = cityInfo.city[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! CityTableViewCell
        
        if segmentControl.selectedSegmentIndex == 0 {
            cell.cityName.text = row.city_name
        } else if segmentControl.selectedSegmentIndex == 1{
            //domestic_travel true인것만 보여주기
            if row.domestic_travel == true {
                cell.cityName.text = row.city_name
            } else {
    
            }
            
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            print("모두보여주기")
        } else if sender.selectedSegmentIndex == 1{
            print("국내만보여주기")
        } else {
            print("해외만보여주기")
        }
        tableView.reloadData()
    }
    
}
