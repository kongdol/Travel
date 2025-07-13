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
        
        //기본정보
        cell.magazineTitle.text = mz.magazine[indexPath.row].title
        cell.magazineTitle.font = UIFont.boldSystemFont(ofSize: 20)
        
        cell.magazineSubtitle.text = mz.magazine[indexPath.row].subtitle
        cell.magazineSubtitle.font = UIFont.systemFont(ofSize: 12)
        cell.magazineSubtitle.textColor = .lightGray
        
        // 이미지
        let url = URL(string: mz.magazine[indexPath.row].photo_image)
        cell.magazineImage.kf.setImage(with: url)
        cell.magazineImage.layer.cornerRadius = 8
        
    
        // 날짜
        let format = DateFormatter()
        format.dateFormat = "yyMMdd"
        let a = mz.magazine[indexPath.row].date
        
        if let dateResult = format.date(from: a) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "yy년MM월dd일"
            let outputString = outputFormatter.string(from: dateResult)
            cell.magazineDate.text = outputString
        } else {
            cell.magazineDate.text = "25년07월14일"
            print("날짜에 기본값이 들어갔어요!")
        }
        
        cell.magazineDate.font = UIFont.systemFont(ofSize: 12)
        cell.magazineDate.textColor = .lightGray
        
        return cell
    }
    
    //셀높이
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    

    
}
