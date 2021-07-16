//
//  FingerGameViewController.swift
//  SwiftPractice
//
//  Created by 이다영 on 2021/07/16.
//

import UIKit

class FingerGameViewController: UIViewController {
    
    @IBOutlet weak var gameView: FingerGameView!
    @IBOutlet weak var secondsLabel: UILabel!
    
    var timer: Timer?
    var secondsTimer: Timer?
    var secondsLeft = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gameView.controller = self
    }
    
    func touchCountDidChange() {
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { (t) in
            for roundView in self.gameView.touchToRoundView.values {
                var randomChoice = Bool.random()
                
                UIView.animate(withDuration: 1) {
                    if randomChoice {
                        roundView.backgroundColor = UIColor(named: "pink")
                    } else {
                        roundView.backgroundColor = UIColor(named: "green")
                    }
                    
                    var roundViewCenter = roundView.center
                    
                    roundView.frame.size = CGSize(width: 120, height: 120)
                    roundView.center = roundViewCenter
                    roundView.layer.cornerRadius = 60
                }
            }
        })
        
        resetSecondsTimer()
    }
    
    func resetSecondsTimer() {
        secondsTimer?.invalidate()
        
        if gameView.touchToRoundView.values.count > 0 {
            secondsLeft = 5
            secondsLabel.text = "5"
            self.blinkTimerLabel()
            
            secondsTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
                self.secondsLeft -= 1
                self.secondsLabel.text = "\(self.secondsLeft)"
                self.blinkTimerLabel()
                
                if self.secondsLeft == 0 {
                    self.secondsLabel.text = ""
                    self.secondsTimer?.invalidate()
                }
            })
        } else {
            secondsLabel.text = ""
        }
    }
    
    func blinkTimerLabel() {
        self.secondsLabel.alpha = 1
        
        UIView.animate(withDuration: 0.5) {
            self.secondsLabel.alpha = 0
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
    
    @IBAction func exitButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
