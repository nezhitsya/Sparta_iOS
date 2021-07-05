//
//  InputViewController.swift
//  SwiftPractice
//
//  Created by 이다영 on 2021/07/05.
//

import UIKit

class InputViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var resultButton: UIButton!
    
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
    
    @IBAction func textEditingChanged(_ sender: Any) {
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
    }
    
}
