# [Burger Shop](https://velog.io/@nezhitsya/스파르타-코딩-클럽-개발일지-3)

<p align="center">
  <img width="300" src="https://user-images.githubusercontent.com/60697742/124530078-cb034c00-de46-11eb-9576-b80c7bb72075.mp4">
</p>

## 화면 구성

<img width="700" src="https://user-images.githubusercontent.com/60697742/124529890-6c3dd280-de46-11eb-9a00-dc16c54ea422.png">

**Page Control** - 페이지 별 상품 종류, 가격 안내 <br>
**Stepper** - 개수 조정 <br>
**TextField** - 개수 표시 및 입력 <br>

### Code

**[ Input Controller ]** <br>

페이지 순으로 나타날 이미지 명, 이미지에 해당하면 버거 명, 버거 가격 리스트 생성

```swift
var image = ["burger2", "burger1", "burger3", "burger4", "burger5"]
var name = ["오리지널 버거", "치즈스틱 버거", "새우 비프 버거", "머쉬룸 버거", "베이컨 버거"]
var price = [6000, 9800, 8700, 8600, 9700]
```

페이지가 변경될 때마다 이미지, 버거 이름, 버거 가격 변경

```swift
@IBAction func pageChanged(_ sender: Any) {
  burgerImage.image = UIImage(named: image[pageControl.currentPage])
  burgerName.text = name[pageControl.currentPage]
  burgerPrice.text = "\(numberFormatter.string(from: NSNumber(value: price[pageControl.currentPage]))!) 원"
}
```

formatter를 사용하여 세 자릿수 마다 , 가 찍히도록 설정하였다.

```swift
var numberFormatter = NumberFormatter()
numberFormatter.numberStyle = .decimal
```

textField에 값을 입력 시 stepper의 value에 반영

```swift
@IBAction func textEditingChanged(_ sender: Any) {
    // text 가 nil 이라면 "" 디폴트 값 설정
    var text = textField.text ?? ""
    // text를 Double 변경 실패 시 0 디폴트 값 설정
    stepper.value = Double(text) ?? 0
}
```

stepper의 값을 textField에 표시

```swift
@IBAction func stepperValueChanged(_ sender: Any) {
    var value = stepper.value
    textField.text = String(Int(value))
}
```

controller 이동 및 값 전달

```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if var controller = segue.destination as? OutputViewController {
        controller.currentPage = Int(pageControl.currentPage)
        controller.numOfBurger = Int(stepper.value)
    }
}
```

**[ Output Controller ]** <br>

버거 값이 2 만원 이상일 경우, 배달 비 0원.
2 만원 미만일 경우 3 천원의 배달 비 추가.

```swift
func setDelivery() {
    if (Int(basicPrice) * Int(numOfBurger)) >= 20000 {
        deliveryFee.text = "0 원"
        resultPrice.text = "\(numberFormatter.string(from: NSNumber(value: Int(basicPrice) * Int(numOfBurger)))!) 원"
    } else {
        deliveryFee.text = "3,000 원"
        resultPrice.text = "\(numberFormatter.string(from: NSNumber(value: (Int(basicPrice) * Int(numOfBurger) + 3000)))!) 원"
    }
}
```
