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

        resultButton.layer.cornerRadius = 10
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if var controller = segue.destination as? OutputViewController {
            controller.numOfPeople = Int(stepper.value)
        }
        
    }
    
    // stepper의 값을 textField에 보여주고, textField에 유저가 값을 텍스트로 입력 시 stepper의 value에 반영
    @IBAction func textEditingChanged(_ sender: Any) {
        // text 가 nil 이라면 "" 디폴트 값 설정
        var text = textField.text ?? ""
        // text를 Double 변경 실패 시 0 디폴트 값 설정
        stepper.value = Double(text) ?? 0
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        var value = stepper.value
        textField.text = String(Int(value))
    }
    
}
