//
//  MagazineTableViewController.swift
//  Travel
//
//  Created by yk on 7/11/25.
//

import UIKit
import Kingfisher

class MagazineTableViewController: UITableViewController {

    let mz = MagazineInfo()
    let format = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackground()
        
        let xib = UINib(nibName: "RealMagazineTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "RealMagazineTableViewCell")
        
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    // 셀갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mz.magazine.count
        
    }
    
    //셀디자인
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RealMagazineTableViewCell", for: indexPath) as! RealMagazineTableViewCell
        
        let row = mz.magazine[indexPath.row]
        
        //기본정보
        cell.configureLabel(row)
        // 이미지
        cell.configureImage(row)
        // 날짜
        cell.configureDate(format: format, row: row)
        
        return cell
    }
    
    //셀높이
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 448
    }
}
