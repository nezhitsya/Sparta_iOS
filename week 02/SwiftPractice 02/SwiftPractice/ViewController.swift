//
//  ViewController.swift
//  SwiftPractice
//
//  Created by 이다영 on 2021/06/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textFields: [UITextField]!
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpAutoFillButton(_ sender: Any) {
        textFields[i].text = "안녕하세요~~😀"
        i += 1
    }
    
    @IBAction func touchUpEraseButton(_ sender: Any) {
        for i in 0..<textFields.count {
            var textField = textFields[i]
            textField.text = ""
        }
        
        i = 0
    }
    
}

