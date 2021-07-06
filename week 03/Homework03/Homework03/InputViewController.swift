//
//  InputViewController.swift
//  Homework03
//
//  Created by 이다영 on 2021/07/06.
//

import UIKit

var image = ["burger2", "burger1", "burger3", "burger4", "burger5"]
var name = ["오리지널 버거", "치즈스틱 버거", "새우 비프 버거", "머쉬룸 버거", "베이컨 버거"]
var price = [6000, 9800, 8700, 8600, 9700]

class InputViewController: UIViewController {
    
    @IBOutlet weak var burgerImage: UIImageView!
    @IBOutlet weak var burgerName: UILabel!
    @IBOutlet weak var burgerPrice: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var nextButton: UIButton!
    
    var numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.layer.cornerRadius = 10
        numberFormatter.numberStyle = .decimal
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var controller = segue.destination as? OutputViewController {
            controller.currentPage = Int(pageControl.currentPage)
            controller.numOfBurger = Int(stepper.value)
        }
    }
    
    @IBAction func pageChanged(_ sender: Any) {
        burgerImage.image = UIImage(named: image[pageControl.currentPage])
        burgerName.text = name[pageControl.currentPage]
        burgerPrice.text = "\(numberFormatter.string(from: NSNumber(value: price[pageControl.currentPage]))!) 원"
    }
    
    @IBAction func textEditingChanged(_ sender: Any) {
        var text = textField.text ?? ""
        stepper.value = Double(text) ?? 0
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        var value = stepper.value
        textField.text = String(Int(value))
    }
    
}
