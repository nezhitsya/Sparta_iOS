# Finger Game

<p align="center">
  <img width="300" src="https://user-images.githubusercontent.com/60697742/125902285-834feab9-3b25-4200-abfc-5f83adf96aa0.mov">
</p>

## 화면 구성

<img width="700" src="https://user-images.githubusercontent.com/60697742/125892593-df16d6c4-c463-4ba4-a8f2-ed4e99f2965f.png">

**UIView** - 게임 화면으로 터치와 연결되는 view

### Firebase Analytics

Firebase 설정

```
GoogleService-Info.plist 다운로드 > 프로젝트에 드래그 앤 드롭 > Copy items if needed
```

<img width="700" src="https://user-images.githubusercontent.com/60697742/125899799-9140e729-84ac-49d6-8d65-13cb0403d0a1.png">

ppDelegate.Swift

```swift
import UIKit
import Firebase // 추가

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure() // 추가
        return true
    }
...
```

<img width="700" src="https://user-images.githubusercontent.com/60697742/125902053-3fbc95bc-8c42-4641-bdcd-6fe38a5b9e86.png">

### AdMob

CocoaPods 업데이트

```
pod 'Firebase/AdMob'
```

AppDelegate.swift 수정

```swift
import UIKit
import Firebase
import GoogleMobileAds // 추가

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure() // 추가

        GADMobileAds.sharedInstance().start(completionHandler: nil) //추가
        return true
    }
...
```

Info.plist 에 추가 (Open As > Source Code)

```
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-3940256099942544~1458002511</string>
<key>SKAdNetworkItems</key>
<array>
    <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>cstr6suwn9.skadnetwork</string>
    </dict>
</array>
<key>NSUserTrackingUsageDescription</key>
<string>This identifier will be used to deliver personalized ads to you.</string>
```

광고 준비하기

```swift
import UIKit
import Firebase
import GoogleMobileAds
import AppTrackingTransparency
import AdSupport

func requestIDFA() {
    ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
        let request = GADRequest()
        GADInterstitialAdBeta.load(withAdUnitID: "ca-app-pub-3940256099942544/4411468910",
                                       request: request) { (ad, error) in
            if error != nil {
                return
            }

            self.interstitial = ad
        }
    })
}
```

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
    requestIDFA()
}
```

터치되면 5 초간 타이머 작동 및 터치 취소 시 타이머 리셋
5 초가 지나면 터치된 곳의 원형 뷰 변형
광고 설정

```swift
func touchCountDidChange() {
    Analytics.logEvent("Game Start", parameters: nil)

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
        Analytics.logEvent("Game End", parameters: ["touchCount": self.gameView.touchToRoundView.count])

        if self.didOpenAd == false {
            self.interstitial?.present(fromRootViewController: self)
            self.didOpenAd = true
        }
    })

    resetSecondsTimer()
}
```

타이머 리셋

```swift
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
