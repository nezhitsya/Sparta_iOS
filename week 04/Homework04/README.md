# [Angel Cat]("https://velog.io/@nezhitsya/스파르타-코딩-클럽-개발일지-4")

<p align="center">
  <img width="300" src="https://user-images.githubusercontent.com/60697742/125215438-73595a80-e2f6-11eb-814b-679619ee9aad.mov">
</p>

## 화면 구성

<img width="700" src="https://user-images.githubusercontent.com/60697742/125215484-91bf5600-e2f6-11eb-8b40-b8af2d593da2.png">

**Image** - 고양이 이미지 로드
**Button** - 새로고침 버튼

### App Transport Security Settings

Info.plist 파일에 App Transport Security Settings를 추가하고 Allow Arbitrary Loads를 YES로 선택 후 추가

<img width="700" src="https://user-images.githubusercontent.com/60697742/125149293-25681980-e173-11eb-9931-bc54bbbe5750.png">

애플은 iOS 9부터 무분별한 http 통신 사용을 지양하고, https 통신을 유도하기 위해 기본값으로 앱에서 http 통신을 막아두었다.
따라서 http 통신을 사용하는 API는 보안 설정이 필요하다.

### Library

- **Almofire** : 네트워크 라이브러리
- **SwiftyJSON** : 서버의 결과로 받은 JSON 데이터를 Swift에서 사용할 수 있도록 해주는 라이브러리
- **SDWebImage** : 웹에 있는 이미지를 이미지 뷰에 간편히 넣어주는 라이브러리

<img width="700" src="https://user-images.githubusercontent.com/60697742/125151162-1d62a680-e180-11eb-9d50-f50cb47ce6d4.png">

### Code

API에 데이터 요청(GET) 후 이미지 URL 추출 및 로드

```swift
func setImage() {
    AF.request("https://api.thecatapi.com/v1/images/search").responseJSON {
        if let json = $0.value {
            let data = JSON(json)
            let image = data.arrayValue[0]["url"]

            self.catImage.sd_setImage(with: URL(string: image.stringValue), completed: nil)
        }
    }
}
```
