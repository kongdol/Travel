//
//  CityTableViewCell.swift
//  Travel
//
//  Created by yk on 7/15/25.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    static let identifier = "CityTableViewCell"
    
    @IBOutlet var cityName: UILabel!
    @IBOutlet var cityImage: UIImageView!
    @IBOutlet var cityExplain: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        cityName.text = "도시이름"
    }

}
