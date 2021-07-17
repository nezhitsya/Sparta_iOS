//
//  FingerGameView.swift
//  Homework05
//
//  Created by 이다영 on 2021/07/17.
//

import UIKit

class FingerGameView: UIView {
    
    // 터치와 뷰를 연결해주는 dictionary
    var touchToRoundView: [UITouch: UIView] = [:]
    weak var controller: FingerGameViewController?
    
    // 터치 시작
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
            view.backgroundColor = UIColor(named: "orange")
            view.layer.cornerRadius = 40 // 사이즈의 절반 입력 시 원 형태
            view.center = touch.location(in: self) // 터치 위치를 받아 뷰의 좌표로 연결
            
            self.touchToRoundView[touch] = view // 원 형태를 뷰에 연결
            self.addSubview(view) // 뷰에 원 형태 뷰 삽입
            self.controller?.touchCountDidChange()
        }
    }
    
    // 터치 이동
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let view = touchToRoundView[touch] // 터치에 해당하는 원 형태 뷰 불러오기
            view?.center = touch.location(in: self) // 원 형태 뷰 위치 업데이트
        }
    }
    
    // 터치 끝
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let view = touchToRoundView[touch] // 터치에 해당하는 원 형태 뷰 불러오기
            view?.removeFromSuperview() // 터치가 끝나면 원 형태 뷰 없애기
            touchToRoundView.removeValue(forKey: touch) // 터치 - 원 형태 뷰 dictionary 에서 해당 뷰 삭제
            
            self.controller?.touchCountDidChange()
        }
    }
    
    // 터치가 비정상적인 이유로 끝남
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let view = touchToRoundView[touch] // 터치에 해당하는 원 형태 뷰 불러오기
            view?.removeFromSuperview()
            touchToRoundView.removeValue(forKey: touch)
            
            self.controller?.touchCountDidChange()
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
