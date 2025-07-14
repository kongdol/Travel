//
//  RealMagazineTableViewCell.swift
//  Travel
//
//  Created by yk on 7/14/25.
//

import UIKit

class RealMagazineTableViewCell: UITableViewCell {
    
    @IBOutlet var realMagazineImage: UIImageView!
    @IBOutlet var realMagazineTitle: UILabel!
    @IBOutlet var realMagazineSubtitle: UILabel!
    
    @IBOutlet var realMagazineDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        fontUI()
    }
    
    func fontUI() {
        realMagazineTitle.font = UIFont.boldSystemFont(ofSize: 20)
        realMagazineSubtitle.font = UIFont.systemFont(ofSize: 12)
        realMagazineSubtitle.textColor = .lightGray
        
        realMagazineDate.font = UIFont.systemFont(ofSize: 12)
        realMagazineDate.textColor = .lightGray
    }
    
    func configureLabel(_ row: Magazine) {
        // 타이틀
        realMagazineTitle.text = row.title
        // 서브타이틀
        realMagazineSubtitle.text = row.subtitle
        
    }
    
    func configureImage(_ row: Magazine) {
        let url = URL(string: row.photo_image)
        realMagazineImage.kf.setImage(with: url)
        realMagazineImage.layer.cornerRadius = 8
    }
    
    func configureDate(format: DateFormatter, row: Magazine) {
        format.dateFormat = "yyMMdd"
        let a = row.date
        
        if let dateResult = format.date(from: a) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "yy년MM월dd일"
            let outputString = outputFormatter.string(from: dateResult)
            realMagazineDate.text = outputString
        } else {
            realMagazineDate.text = "25년07월14일"
            print("날짜에 기본값이 들어갔어요!")
        }
    }
  
}
