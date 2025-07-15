//
//  threeixnineViewController.swift
//  Travel
//
//  Created by yk on 7/13/25.
//

import UIKit

class threeixnineViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var label: UILabel!
    @IBOutlet var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    @IBAction func enter(_ sender: UITextField) {
        if let number = Int(textField.text!) {
            threesixnine(number)
        } else {
            //TODO: alert 만들기
            print("숫자가아닙니다")
        }
    }
    
    func configure() {
        textView.isEditable = false
        textView.textColor = .lightGray
        
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    func threesixnine(_ number: Int) {
        var str = ""
        let baksu = "👏"
        var count = 0
        
        for i in 1...number {
            let num = String(i)
            for j in num {
                if j == "3" || j == "6" || j == "9" {
                    str = str + baksu
                    count = count + 1
                } else {
                    str = str + String(j)
                }
                
            }
            str = str + ", "
        }
        print(count)
        
        str.removeLast(2)
        textView.text = str
        result(number, count)
    }
    
    func result(_ number: Int, _ count: Int) {
        label.text = "숫자 \(number) 까지 총 박수는 \(count)번 입니다"
    }
}

// TODO: - 텍스트뷰, 레이블 스택뷰로 묶어서 텍스트뷰 유동적으로 구현하기
