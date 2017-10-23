# Refresher
Simple and easy to use library with Pull to refresh in Swift.

![image](https://github.com/pengpengCoder/Refresher/blob/master/Screenshots/indicator_header.gif)
![image](https://github.com/pengpengCoder/Refresher/blob/master/Screenshots/indicatorText_header.gif)
![image](https://github.com/pengpengCoder/Refresher/blob/master/Screenshots/indicatorImage_header.gif)
![image](https://github.com/pengpengCoder/Refresher/blob/master/Screenshots/indicator_footer.gif)

## Requirements

* Xcode 7 or higher
* iOS 8.0 or higher
* Swift 3.0


## Demo
Open and run the Refresher project in Xcode to see Refresher in action.

## Manual
Add Refresher folder into your project.


## Example usage
```swift
tableView.ref_setIndicatorHeader { [weak self] in
// [Th]: do network refresh request here
// post or get request ,Do you want to remember after the request to end the refresh
// code: self?.tableView.ref_endRefreshing()
}

// if you want to be the controller's view appears when they want to refresh you need to implement a piece of code in the following way 

override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    tableView.ref_beginRefreshing()
}

```


## Description
This library contains the drop-down and method。

## Thank you
If the library is useful to you, please pay attention to me, later will be updated to the library to do for a long time, thank you
















