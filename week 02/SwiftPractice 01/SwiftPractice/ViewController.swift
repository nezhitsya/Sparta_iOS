//
//  ViewController.swift
//  SwiftPractice
//
//  Created by 이다영 on 2021/06/30.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cardImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var isBackSide = true

    @IBAction func touchUpFlipButton(_ sender: Any) {
        UIView.transition(with: cardImage, duration: 0.6, options: .transitionFlipFromLeft) {
            // animation의 결과물
            if self.isBackSide {
                self.cardImage.image = UIImage(named: "ace")
            } else {
                self.cardImage.image = UIImage(named: "poker")
            }
        } completion: { (animated) in
            // animation 이후 처리
            // ! 뒤의 값이 False면 True로, True면 False로 변경해준다.
            self.isBackSide = !self.isBackSide
        }
    }
    
}

