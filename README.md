# Refresher
Simple and easy to use library with Pull to refresh in Swift.


## Example usage

#### Indicator Header

```swift
tableView.ref_setIndicatorHeader { [weak self] in
// [Th]: do network refresh request here
// post or get request ,Do you want to remember after the request to end the refresh
// code: self?.tableView.ref_endRefreshing()
}
```
![image](https://github.com/pengpengCoder/Refresher/blob/master/Screenshots/indicator_header.gif)

#### Text Header

```swift
tableView.ref_setTextHeader { [weak self] in
// [Th]: do network refresh request here
// post or get request ,Do you want to remember after the request to end the refresh
// code: self?.tableView.ref_endRefreshing()
}
```

![image](https://github.com/pengpengCoder/Refresher/blob/master/Screenshots/indicatorText_header.gif)



#### GIF + Text Header

```swift
tableView.ref_setGIFTextHeader(data: data) { [weak self] in
// [Th]: do network refresh request here
// post or get request ,Do you want to remember after the request to end the refresh
// code: self?.tableView.ref_endRefreshing()
}
```

![image](https://github.com/pengpengCoder/Refresher/blob/master/Screenshots/indicatorImage_header.gif)




#### Indicator Footer

```swift
tableView.ref_setIndicatorFooter { [weak self] in
// [Th]: do network refresh request here
// post or get request ,Do you want to remember after the request to end the refresh
// code: self?.tableView.ref_endRefreshing()
}
```

or

```swift
tableView.ref_setIndicatorAutoFooter { [weak self] in
// [Th]: do network refresh request here
// post or get request ,Do you want to remember after the request to end the refresh
// code: self?.tableView.ref_endRefreshing()
}
```
![image](https://github.com/pengpengCoder/Refresher/blob/master/Screenshots/indicator_footer.gif)



#### Text Footer

```swift
tableView.ref_setTextFooter { [weak self] in
// [Th]: do network refresh request here
// post or get request ,Do you want to remember after the request to end the refresh
// code: self?.tableView.ref_endRefreshing()
}
```

or

```swift
tableView.ref_setTextAutoFooter { [weak self] in
// [Th]: do network refresh request here
// post or get request ,Do you want to remember after the request to end the refresh
// code: self?.tableView.ref_endRefreshing()
}
```
![image](https://github.com/pengpengCoder/Refresher/blob/master/Screenshots/indicator_footer.gif)



## Requirements

* Xcode 7 or higher
* iOS 8.0 or higher
* Swift 3.0



## Demo
Open and run the Refresher project in Xcode to see Refresher in action.

##Manual

Add DGElasticPullToRefresh folder into your project.



## Description
end pull to refresh:

```
func ref_endRefreshing()
```














