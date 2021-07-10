//
//  DetailViewController.swift
//  SwiftPractice
//
//  Created by 이다영 on 2021/07/10.
//

import UIKit
import SwiftyJSON

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var linkButton: UIBarButtonItem!
    
    var memo: JSON!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.sd_setImage(with: URL(string: memo["image"].stringValue), completed: nil)
        
        contentTextView.text = memo["desc"].stringValue
        commentTextView.text = memo["comment"].stringValue
        
        self.title = memo["title"].stringValue
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func linkButtonClicked(_ sender: Any) {
        UIApplication.shared.open(URL(string: memo["url"].stringValue)!, options: [:], completionHandler: nil)
    }
    
}
