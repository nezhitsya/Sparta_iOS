# Poker 2

<p align="center">
  <img width="300" src="https://user-images.githubusercontent.com/60697742/124045596-f3580880-da4a-11eb-9aee-36cfe27dbd30.mov">
</p>

## 화면 구성

<img width="700" src="https://user-images.githubusercontent.com/60697742/124045736-49c54700-da4b-11eb-9b4e-9b0fb62fd7da.png">

**ImageView** - poker 이미지 삽입
**Switch** - 뒤집기 on / off 버튼

### Code

기존 Practice 1의 코드에서 button을 switch로 바꾸어준다.

switch가 on 상태일 때는 앞면을, off 상태일 때는 뒷면을 보여주도록 한다.

```swift
@IBAction func switchValueChanged(_ sender: Any) {
    UIView.transition(with: cardImage, duration: 0.6, options: .transitionFlipFromLeft) {
        // animation의 결과물
        if self.flipSwtich.isOn {
            self.cardImage.image = UIImage(named: "ace")
        } else {
            self.cardImage.image = UIImage(named: "poker")
        }
    } completion: { (animated) in
        // animation 이후 처리
    }
}
```
