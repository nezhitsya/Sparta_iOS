# Poker

<p align="center">
  <img width="300" src="https://user-images.githubusercontent.com/60697742/123720265-a515fe80-d8be-11eb-8f31-4b843f3e96e0.mov">
</p>

## 화면 구성

<img width="700" src="https://user-images.githubusercontent.com/60697742/123884573-7e22ff80-d986-11eb-810e-da5993187e2a.png">

**ImageView** - poker 이미지 삽입
**Button** - 뒤집기 버튼

### Code

이미지가 뒷면인지, 앞면인지 판별할 수 있도록 bool 변수를 지정해준다.

```swift
var isBackSide = true
```

flip button이 눌리면 왼쪽으로 뒤집어지는 애니메이션과 함께 이미지가 바뀌며, 위에 지정한 bool 변수의 값을 변경해준다.

```swift
@IBAction func touchUpFlipButton(_ sender: Any) {
    UIView.transition(with: cardImage, duration: 0.6, options: .transitionFlipFromLeft) {
        // animation의 결과물
        if self.isBackSide {
            self.cardImage.image = UIImage(named: "ace")
        } else {
            self.cardImage.image = UIImage(named: "poker")
        }
    } completion: { (animated) in
        // animation 이후 처리
        // ! 뒤의 값이 False면 True로, True면 False로 변경해준다.
        self.isBackSide = !self.isBackSide
    }
}
```
