# [Finger Game](https://velog.io/@nezhitsya/스파르타-코딩-클럽-개발일지-5)

<p align="center">
  <img width="300" src="https://user-images.githubusercontent.com/60697742/126028737-6accf4ce-f97e-47dd-86aa-b6299d808f3a.mov">
</p>

## 화면 구성

<img width="700" src="https://user-images.githubusercontent.com/60697742/125892593-df16d6c4-c463-4ba4-a8f2-ed4e99f2965f.png">

**UIView** - 게임 화면으로 터치와 연결되는 view

### Code

**FingerGameView** <br>

게임 View 세팅

```swift
// 터치와 뷰를 연결해주는 dictionary
var touchToRoundView: [UITouch: UIView] = [:]
weak var controller: FingerGameViewController?
```

터치 시작

```swift
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
```

터치 이동

```swift
override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
        let view = touchToRoundView[touch] // 터치에 해당하는 원 형태 뷰 불러오기
        view?.center = touch.location(in: self) // 원 형태 뷰 위치 업데이트
    }
}
```

터치 끝

```swift
override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
        let view = touchToRoundView[touch] // 터치에 해당하는 원 형태 뷰 불러오기
        view?.removeFromSuperview() // 터치가 끝나면 원 형태 뷰 없애기
        touchToRoundView.removeValue(forKey: touch) // 터치 - 원 형태 뷰 dictionary 에서 해당 뷰 삭제

        self.controller?.touchCountDidChange()
    }
}
```

터치가 비정상적인 이유로 끝남

```swift
override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
        let view = touchToRoundView[touch] // 터치에 해당하는 원 형태 뷰 불러오기
        view?.removeFromSuperview()
        touchToRoundView.removeValue(forKey: touch)

        self.controller?.touchCountDidChange()
    }
}
```

**FingerGameViewController** <br>

GameView 연결

```swift
@IBOutlet weak var gameView: FingerGameView!

...

override func viewDidLoad() {
    super.viewDidLoad()

    gameView.controller = self
}
```

터치되면 5 초간 타이머 작동 및 터치 취소 시 타이머 리셋
5 초가 지나면 터치된 곳의 원형 뷰 변형

```swift
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
```

타이머 리셋

```swift
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
```

글자 깜빡이는 효과

```swift
func blinkTimerLabel() {
    self.secondsLabel.alpha = 1

    UIView.animate(withDuration: 0.5) {
        self.secondsLabel.alpha = 0
    }
}
```
