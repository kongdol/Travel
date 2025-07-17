//
//  DetailTravelViewController.swift
//  Travel
//
//  Created by yk on 7/15/25.
//

import UIKit
import Kingfisher

class DetailTravelViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var backButton: UIButton!
    
    var city: Travel = Travel(title: "", description: nil, travel_image: nil, grade: nil, save: nil, like: nil, ad: nil)
    
    var name = "고래밥"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imgUrl = city.travel_image ?? ""
        let url = URL(string: imgUrl)
        imageView.kf.setImage(with: url)
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        
        titleLabel.text = city.title
        subtitleLabel.text = city.description
        subtitleLabel.numberOfLines = 0
        
        
        
    }
    

    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
