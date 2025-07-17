//
//  AdViewController.swift
//  Travel
//
//  Created by yk on 7/15/25.
//

import UIKit

class AdViewController: UIViewController {

    @IBOutlet var adLabel: UILabel!
    
    var content = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        adLabel.text = content
        adLabel.font = UIFont.boldSystemFont(ofSize: 16)
        adLabel.numberOfLines = 0
    }
    

    @IBAction func xbuttonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
