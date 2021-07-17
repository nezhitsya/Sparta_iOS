//
//  FingerGameViewController.swift
//  Homework05
//
//  Created by 이다영 on 2021/07/17.
//

import UIKit

class FingerGameViewController: UIViewController {
    
    @IBOutlet weak var gameView: FingerGameView!
    @IBOutlet weak var secondsLabel: UILabel!
    
    var timer: Timer?
    var secondsTimer: Timer?
    var secondsLeft = 5
    var didOpenAd = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameView.controller = self
    }
    
    func touchCountDidChange() {
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { (t) in
            let roundViews = [UIView](self.gameView.touchToRoundView.values)
            
            // 터치 개수가 0이면 반응 무
            if roundViews.count == 0{
                return
            }
            
            let randomChoice = Int.random(in: 0..<roundViews.count)
            
            for i in 0..<roundViews.count {
                let roundView = roundViews[i]
                
                UIView.animate(withDuration: 1) {
                    if i == randomChoice {
                        roundView.backgroundColor = UIColor(named: "pink")
                        
                        let center = roundView.center
                        roundView.frame.size = CGSize(width: 120, height: 120)
                        roundView.center = center
                        roundView.layer.cornerRadius = 60
                    } else {
                        roundView.backgroundColor = UIColor(named: "green")
                    }
                }
            }
        })
        
        resetSecondsTimer()
    }
    
    func resetSecondsTimer() {
        secondsTimer?.invalidate()
        
        if gameView.touchToRoundView.count > 0 {
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
                    self.blinkTimerLabel()
                }
            })
        } else {
            self.secondsLabel.text = ""
            self.blinkTimerLabel()
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
