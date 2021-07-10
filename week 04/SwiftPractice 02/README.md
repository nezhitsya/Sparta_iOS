# Link Memo

<p align="center">
  <img width="300" src="https://user-images.githubusercontent.com/60697742/125154201-d8486f80-e193-11eb-989a-595c9c48b1ae.mp4">
</p>

## 화면 구성

<img width="700" src="https://user-images.githubusercontent.com/60697742/125154332-85bb8300-e194-11eb-9de0-447577f0c97b.png">

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

**MemoCollectionViewController** <br>

화면 뜨기 직전에 데이터 요청 (GET)

```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    AF.request("http://spartacodingclub.shop/post").responseJSON { (response) in
        if var value = response.value {
            self.reviews = JSON(value)["reviews"].arrayValue
            self.tableView.reloadData()
        }
    }
}
```

컬렉션 뷰에 데이터 연결

```swift
override func numberOfSections(in collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
}


override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of items
    return memos.count
}

override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemoCell", for: indexPath)
    var memo = memos[indexPath.item]

    if var memoCell = cell as? MemoCollectionViewCell {
        memoCell.imageView.sd_setImage(with: URL(string: memo["image"].stringValue), completed: nil)
    }

    return cell
}
```

셀 너비 커스텀

```swift
// UICollectionViewDelegateFlowLayout 상속 후
func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    var width = self.collectionView.bounds.width / 3 - 5

    return CGSize(width: width, height: width)
}

```

셀 선택 시 넘어가는 화면에 데이터 전달

```swift
override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    selectedMemo = memos[indexPath.item]
    performSegue(withIdentifier: "DetailView", sender: self)
}
```

**DetailViewController** <br>

이전 페이지에서 데이터 받아서 로드

```swift
// var memo: JSON! 을 선언하여 받아옴
imageView.sd_setImage(with: URL(string: memo["image"].stringValue), completed: nil)

contentTextView.text = memo["desc"].stringValue
commentTextView.text = memo["comment"].stringValue
```

해당 url 웹 페이지 열기

```swift
@IBAction func linkButtonClicked(_ sender: Any) {
    UIApplication.shared.open(URL(string: memo["url"].stringValue)!, options: [:], completionHandler: nil)
}
```

**AddMemoViewController** <br>

데이터 전송 (POST)

```swift
var parameters = [
    "url_give": url,
    "comment_give": comment
]

AF.request("http://spartacodingclub.shop/post", method: .post, parameters: parameters).responseJSON { (response) in
    if var value = response.value {
        var json = JSON(response.value!)

        self.navigationController?.popViewController(animated: true)
    }
}
```
