//
//  ViewController.swift
//  Homework01
//
//  Created by 이다영 on 2021/06/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flash: UIImageView!
    @IBOutlet weak var appTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appTitle.textColor = UIColor.lightGray
        view.backgroundColor = UIColor(red: 0.17, green: 0.25, blue: 0.30, alpha: 1.00)
    }
    
    @IBAction func touchUpOnButton(_ sender: Any) {
        appTitle.textColor = UIColor.black
        flash.image = UIImage(systemName: "flashlight.on.fill")
        view.backgroundColor = UIColor(red: 0.93, green: 0.70, blue: 0.25, alpha: 1.00)
    }
    
    @IBAction func touchUpOffButton(_ sender: Any) {
        appTitle.textColor = UIColor.lightGray
        flash.image = UIImage(systemName: "flashlight.off.fill")
        view.backgroundColor = UIColor(red: 0.17, green: 0.25, blue: 0.30, alpha: 1.00)
    }
    
}

