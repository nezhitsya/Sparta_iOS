# Book Review

## 화면 구성

<img width="800" src="https://user-images.githubusercontent.com/60697742/125150632-4123ed80-e17c-11eb-868c-a072752e006d.png">

### App Transport Security Settings

Info.plist 파일에 App Transport Security Settings를 추가하고 Allow Arbitrary Loads를 YES로 선택 후 추가

<img width="700" src="https://user-images.githubusercontent.com/60697742/125149293-25681980-e173-11eb-9931-bc54bbbe5750.png">

애플은 iOS 9부터 무분별한 http 통신 사용을 지양하고, https 통신을 유도하기 위해 기본값으로 앱에서 http 통신을 막아두었다.
따라서 http 통신을 사용하는 API는 보안 설정이 필요하다.

### Library

- **Almofire** : 네트워크 라이브러리
- **SwiftyJSON** : 서버의 결과로 받은 JSON 데이터를 Swift에서 사용할 수 있도록 해주는 라이브러리

<img width="700" src="https://user-images.githubusercontent.com/60697742/125149570-ac69c180-e174-11eb-82b6-d388b934f0fa.png">

### Code

화면 뜨기 직전에 데이터 요청 (GET)

```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    AF.request("http://spartacodingclub.shop/review").responseJSON { (response) in
        if var value = response.value {
            self.reviews = JSON(value)["reviews"].arrayValue
            self.tableView.reloadData()
        }
    }
}
```

테이블 뷰에 데이터 연결

```swift
override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
}

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return reviews.count
}

override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath)
    var review = reviews[indexPath.row]

    cell.textLabel?.text = "\(review["author"].stringValue) - \(review["title"].stringValue)"
    cell.detailTextLabel?.text = "\(review["review"].stringValue)"

    return cell
}
```

데이터 전송 (POST)

```swift
var parameters = [
    "title_give": title,
    "author_give": author,
    "review_give": review
]

AF.request("http://spartacodingclub.shop/review", method: .post, parameters: parameters).responseJSON { (response) in
    if var value = response.value {
        // 입력 화면이 사라지고 테이블 뷰로 돌아가기
        self.navigationController?.popViewController(animated: true)
    }
}
```

알림 띄우기

```swift
if title.count == 0 || author.count == 0 || review.count == 0 {
    var alert = UIAlertController(title: "책리뷰", message: "모두 입력해주세요😀", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))

    self.present(alert, animated: true, completion: nil)
    return
}
```
