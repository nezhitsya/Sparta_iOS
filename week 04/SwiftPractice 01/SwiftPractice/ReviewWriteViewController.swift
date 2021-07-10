//
//  ReviewWriteViewController.swift
//  SwiftPractice
//
//  Created by 이다영 on 2021/07/10.
//

import UIKit
import Alamofire
import SwiftyJSON

class ReviewWriteViewController: UIViewController {
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var authorText: UITextField!
    @IBOutlet weak var reviewText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        var title = titleText.text ?? ""
        var author = authorText.text ?? ""
        var review = reviewText.text ?? ""
        
        if title.count == 0 || author.count == 0 || review.count == 0 {
            var alert = UIAlertController(title: "책리뷰", message: "모두 입력해주세요😀", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        var parameters = [
            "title_give": title,
            "author_give": author,
            "review_give": review
        ]
        
        AF.request("http://spartacodingclub.shop/review", method: .post, parameters: parameters).responseJSON { (response) in
            if var value = response.value {
                // 입력 화면이 사라지고 테이블 뷰로 돌아가기
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
}
