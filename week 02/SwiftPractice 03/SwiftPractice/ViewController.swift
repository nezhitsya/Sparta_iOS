//
//  ViewController.swift
//  SwiftPractice
//
//  Created by 이다영 on 2021/06/30.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var flipSwtich: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchValueChanged(_ sender: Any) {
        UIView.transition(with: cardImage, duration: 0.6, options: .transitionFlipFromLeft) {
            // animation의 결과물
            if self.flipSwtich.isOn {
                self.cardImage.image = UIImage(named: "ace")
            } else {
                self.cardImage.image = UIImage(named: "poker")
            }
        } completion: { (animated) in
            // animation 이후 처리
        }
    }
    
}

