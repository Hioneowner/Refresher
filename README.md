# Refresher
Simple and easy to use library with Pull to refresh in Swift.


## Example usage

#### Indicator Header

```swift
scrollView.ref_setIndicatorHeader { [weak self] in
// [Th]: do network refresh request here
// post or get request ,Do you want to remember after the request to end the refresh
// code: self?.scrollView.ref_endRefreshing()
}
```
![image](https://github.com/pengpengCoder/Refresher/blob/master/Screenshots/indicator_header.gif)

#### Text Header

```swift
scrollView.spr_setTextHeader { [weak self] in
// [Th]: do network refresh request here
// post or get request ,Do you want to remember after the request to end the refresh
// code: self?.scrollView.ref_endRefreshing()
}
```

![image](https://github.com/pengpengCoder/Refresher/blob/master/Screenshots/indicatorText_header.gif)



#### GIF + Text Header

```swift
scrollView.ref_setGIFTextHeader(data: data) { [weak self] in
// do your action here
// self?.scrollView.spr_endRefreshing()
}
```

![image](https://github.com/pengpengCoder/Refresher/blob/master/Screenshots/indicatorImage_header.gif)




#### Indicator Footer

```swift
scrollView.ref_setIndicatorFooter { [weak self] in
// do your action here
// self?.scrollView.spr_endRefreshing()
}
```

or

```swift
scrollView.ref_setIndicatorAutoFooter { [weak self] in
// do your action here
// self?.scrollView.ref_endRefreshing()
}
```

![image](https://github.com/pengpengCoder/Refresher/blob/master/Screenshots/indicator_footer.gif)



#### Text Footer

```swift
scrollView.ref_setTextFooter { [weak self] in
// do your action here
// self?.scrollView.spr_endRefreshing()
}
```

or

```swift
scrollView.ref_setTextAutoFooter { [weak self] in
// do your action here
// self?.scrollView.ref_endRefreshing()
}
```

