//
//  AddMemoViewController.swift
//  SwiftPractice
//
//  Created by 이다영 on 2021/07/10.
//

import UIKit
import Alamofire
import SwiftyJSON

class AddMemoViewController: UIViewController {
    
    @IBOutlet weak var urlText: UITextField!
    @IBOutlet weak var commentText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        urlText.layer.cornerRadius = 10
        urlText.layer.borderWidth = 1
        urlText.layer.borderColor = UIColor.systemOrange.cgColor
        urlText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        urlText.leftViewMode = .always
        
        commentText.layer.cornerRadius = 10
        commentText.layer.borderWidth = 1
        commentText.layer.borderColor = UIColor.systemOrange.cgColor
        commentText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        commentText.leftViewMode = .always
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func doneButtonClicked(_ sender: Any) {
        var url = urlText.text ?? ""
        var comment = commentText.text ?? ""
        
        if url.count == 0 || comment.count == 0 {
            var alert = UIAlertController(title: "메모장", message: "모두 입력해주세요🤬", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        var parameters = [
            "url_give": url,
            "comment_give": comment
        ]
        
        AF.request("http://spartacodingclub.shop/post", method: .post, parameters: parameters).responseJSON { (response) in
            if var value = response.value {
                var json = JSON(response.value!)
                
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
}
