//
//  OutputViewController.swift
//  SwiftPractice
//
//  Created by 이다영 on 2021/07/05.
//

import UIKit

class OutputViewController: UIViewController {
    
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var chickenLabel: UILabel!
    
    var numOfPeople: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        peopleLabel.text = "\(numOfPeople) 명이서\n먹는다면 ..."
        chickenLabel.text = "\(calculateChicken()) 마리를 시켜라"
    }
    
    func calculateChicken() -> Int {
        return fibonacci(x: numOfPeople)
    }
    
    func fibonacci(x: Int) -> Int {
        if x == 0 {
            return 0
        }
        
        if x == 1 {
            return 1
        }
        
        var a = 1
        var b = 1
        
        while true {
            var c = a + b
            
            if c > x {
                return a + fibonacci(x: x - b)
            } else if c == x {
                return b
            }
            
            a = b
            b = c
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
