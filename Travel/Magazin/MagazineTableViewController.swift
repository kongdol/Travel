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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // 셀갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mz.magazine.count
        
    }
    
    //셀디자인
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "magazineCell", for: indexPath) as! MagazineTableViewCell
        
        cell.magazineTitle.text = mz.magazine[indexPath.row].title
        cell.magazineSubtitle.text = mz.magazine[indexPath.row].subtitle
        let url = URL(string: mz.magazine[indexPath.row].photo_image)
        cell.magazineImage.kf.setImage(with: url)
        cell.magazineDate.text = mz.magazine[indexPath.row].date
        
        return cell
    }
    
    //셀높이
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    

    
}
