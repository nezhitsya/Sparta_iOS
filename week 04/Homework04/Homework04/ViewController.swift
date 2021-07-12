//
//  ViewController.swift
//  Homework04
//
//  Created by 이다영 on 2021/07/11.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var catImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setImage()
    }
    
    func setImage() {
        AF.request("https://api.thecatapi.com/v1/images/search").responseJSON {
            if let json = $0.value {
                let data = JSON(json)
                let image = data.arrayValue[0]["url"]
                
                self.catImage.sd_setImage(with: URL(string: image.stringValue), completed: nil)
            }
        }
    }

    @IBAction func imageButtonClicked(_ sender: Any) {
        setImage()
    }
    
}

