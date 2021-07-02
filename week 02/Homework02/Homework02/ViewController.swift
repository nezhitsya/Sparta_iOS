//
//  ViewController.swift
//  Homework02
//
//  Created by 이다영 on 2021/07/02.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timerButton: UIButton!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var timer: Timer?
    var timeRange: Int = 180
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerButton.layer.cornerRadius = 10
        
        setUpTimeLabel()
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
        timerButton.setTitle("Start", for: .normal)
    }
    
    func setUpTimeLabel() {
        var minutes = self.timeRange / 60
        var seconds = self.timeRange % 60
        
        if self.timeRange < 10 {
            if timeRange % 2 != 0 {
                self.view.backgroundColor = UIColor.orange
            } else {
                self.view.backgroundColor = UIColor.white
            }
        }
        
        UIView.transition(with: self.timeLabel, duration: 0.3, options: .transitionFlipFromTop) {
            if self.timeRange > 0 {
                self.timeLabel.text = String(format: "%02d : %02d", minutes, seconds)
            } else {
                self.timeLabel.text = "DONE"
            }
        } completion: { (animated) in
        }
    }
    
    func setUpTimeRange() {
        var seg = segmentControl.selectedSegmentIndex
        
        if seg == 0 {
            self.timeRange = 180
        } else if seg == 1 {
            self.timeRange = 240
        } else {
            self.timeRange = 600
        }
        
        self.setUpTimeLabel()
    }

    @IBAction func touchUpTimerButton(_ sender: Any) {
        if timer != nil {
            resetTimer()
            return
        }
        
        self.timerButton.setTitle("Quit", for: .normal)
        self.setUpTimeRange()
        self.view.backgroundColor = UIColor.white
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { t in
            self.timeRange -= 1
            self.setUpTimeLabel()
            
            if self.timeRange == 0 {
                self.resetTimer()
            }
        }
    }
    
    @IBAction func segmentValueChanged(_ sender: Any) {
        self.view.backgroundColor = UIColor.white
        self.resetTimer()
        self.setUpTimeRange()
    }
    
}

