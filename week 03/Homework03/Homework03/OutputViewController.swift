//
//  OutputViewController.swift
//  Homework03
//
//  Created by 이다영 on 2021/07/06.
//

import UIKit

var im = ["burger2", "burger1", "burger3", "burger4", "burger5"]
var nam = ["오리지널 버거", "치즈스틱 버거", "새우 비프 버거", "머쉬룸 버거", "베이컨 버거"]
var pric = [6000, 9800, 8700, 8600, 9700]

class OutputViewController: UIViewController {

    @IBOutlet weak var burgerImage: UIImageView!
    @IBOutlet weak var burgerName: UILabel!
    @IBOutlet weak var burgerPrice: UILabel!
    @IBOutlet weak var deliveryFee: UILabel!
    @IBOutlet weak var resultPrice: UILabel!
    
    var numberFormatter = NumberFormatter()
    var basicPrice: Int = 0
    var numOfBurger: Int = 0
    var currentPage: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberFormatter.numberStyle = .decimal

        burgerImage.image = UIImage(named: im[currentPage])
        burgerName.text = nam[currentPage]
        basicPrice = pric[currentPage]
        burgerPrice.text = "\(numberFormatter.string(from: NSNumber(value: (Int(basicPrice) * Int(numOfBurger))))!) 원"
        
        setDelivery()
    }
    
    func setDelivery() {
        if (Int(basicPrice) * Int(numOfBurger)) >= 20000 {
            deliveryFee.text = "0 원"
            resultPrice.text = "\(numberFormatter.string(from: NSNumber(value: Int(basicPrice) * Int(numOfBurger)))!) 원"
        } else {
            deliveryFee.text = "3,000 원"
            resultPrice.text = "\(numberFormatter.string(from: NSNumber(value: (Int(basicPrice) * Int(numOfBurger) + 3000)))!) 원"
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
