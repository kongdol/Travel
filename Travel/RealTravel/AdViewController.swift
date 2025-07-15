//
//  AdViewController.swift
//  Travel
//
//  Created by yk on 7/15/25.
//

import UIKit

class AdViewController: UIViewController {

    
    @IBOutlet var adLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        adLabel.text = "도쿄 여행 예약은?\n 수업이 있는데\n 가실 생각은 아니시죠?"
        adLabel.font = UIFont.boldSystemFont(ofSize: 16)
        adLabel.numberOfLines = 0
    }
    

    @IBAction func xbuttonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
