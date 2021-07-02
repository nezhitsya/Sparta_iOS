# Ramen Timer

<p align="center">
  <img width="300" src="https://user-images.githubusercontent.com/60697742/124218343-00e9bd00-db35-11eb-9622-1f00c970f5ba.mov">
  <img width="300" src="https://user-images.githubusercontent.com/60697742/124218347-02b38080-db35-11eb-97e8-4d593e8121f9.mov">
</p>

## 화면 구성

<img width="700" src="https://user-images.githubusercontent.com/60697742/124218497-47d7b280-db35-11eb-9676-f72daf393562.png">

**SegmentedControl** - poker 이미지 삽입 <br>
**Button** - 타이머 On / Off 버튼 <br>
**Label** - 경과 시간 <br>

### Code

**타이머 리셋**

```swift
func resetTimer() {
    timer?.invalidate()
    timer = nil
    timerButton.setTitle("Start", for: .normal)
}
```

**경과 시간 라벨** <br>

- 분 = 남은 시간을 60으로 나눈 몫
- 초 = 남은 시간을 60으로 나눈 나머지
- 남은 시간이 10 미만일 때, 홀수 초의 화면 색 변경
- 라벨에 애니메이션 효과 삽입

```swift
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
```

**SegmentedControl** <br>

컨트롤의 인덱스마다 시간 범위 변경

```swift
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
```

컨트롤의 값(인덱스 값)이 변할때마다 타이머 리셋 및 시간 범위 변경

```swift
@IBAction func segmentValueChanged(_ sender: Any) {
    self.view.backgroundColor = UIColor.white
    self.resetTimer()
    self.setUpTimeRange()
}
```

**타이머 On / Off 버튼** <br>

타이머 버튼이 눌리면 버튼의 타이틀 변경 및 라벨 업데이트

```swift
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
```
