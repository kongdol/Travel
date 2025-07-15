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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imgUrl = "https://images.unsplash.com/photo-1600215754990-6e7946d1e37a?q=80&w=2592&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
        let url = URL(string: imgUrl)
        imageView.kf.setImage(with: url)
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        
        titleLabel.text = "카오산 로드"
        subtitleLabel.text = "낮과 밤 서로 다른 매력을 지닌 번화한 거리"
        subtitleLabel.numberOfLines = 0
        
    }
    

    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
