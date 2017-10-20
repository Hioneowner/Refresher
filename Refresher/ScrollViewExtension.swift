//
//  ScrollViewExtension.swift
//  Refresher
//
//  Created by MingChen on 2017/10/20.
//  Copyright © 2017年 MingChen. All rights reserved.
//

import UIKit

private var refreshHeaderKey: UInt8 = 0
private var refreshFooterKey: UInt8 = 0

public extension UIScrollView {
    private var ref_refreshHeader: RefreshView? {
        get {
            return objc_getAssociatedObject(self, &refreshHeaderKey) as? RefreshView
        }
        set {
            objc_setAssociatedObject(self, &refreshHeaderKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            newValue.map { insertSubview($0, at: 0) }
        }
    }

    private var ref_refreshFooter: RefreshView? {
        get {
            return objc_getAssociatedObject(self, &refreshFooterKey) as? RefreshView
        }
        set {
            objc_setAssociatedObject(self, &refreshFooterKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            newValue.map { insertSubview($0, at: 0) }
        }
    }
    
    func setNewValue(value: String) {
        
    }

    
    
    
    public func ref_setIndicatorHeader(height: CGFloat = Default.short,
                                       action: @escaping () -> Void) {
        ref_refreshHeader = IndicatorHeader(height: height, action: action)
    }

    
    public func ref_setTextHeader(loadingText: String = Default.loadingText,
                                  pullingText: String = Default.pullingText,
                                  releaseText: String = Default.releaseText,
                                  height: CGFloat = Default.short,
                                  action: @escaping () -> Void) {
        let textItem = TextItem(loadingText: loadingText, pullingText: pullingText, releaseText: releaseText)
        ref_refreshHeader = TextHeader(textItem: textItem, height: height, action: action)
    }

    
    public func ref_setGIFHeader(data: Data,
                                 isBig: Bool,
                                 height: CGFloat,
                                 action: @escaping () -> Void) {
        ref_refreshHeader = GIFHeader(data: data, isBig: isBig, height: height, action: action)
    }

    
    public func ref_setGIFTextHeader(data: Data,
                                     loadingText: String = Default.loadingText,
                                     pullingText: String = Default.pullingText,
                                     releaseText: String = Default.releaseText,
                                     height: CGFloat = Default.short,
                                     action: @escaping () -> Void) {
        let textItem = TextItem(loadingText: loadingText, pullingText: pullingText, releaseText: releaseText)
        ref_refreshHeader = GIFTextHeader(data: data, textItem: textItem, height: height, action: action)
    }

    
    public func ref_setIndicatorFooter(height: CGFloat = Default.short,
                                       action: @escaping () -> Void) {
        ref_refreshFooter = IndicatorFooter(height: height, action: action)
    }

    
    public func ref_setTextFooter(loadingText: String = Default.loadingText,
                                  pullingText: String = Default.pullingFooterText,
                                  releaseText: String = Default.releaseFooterText,
                                  height: CGFloat = Default.short,
                                  action: @escaping () -> Void) {
        let textItem = TextItem(loadingText: loadingText, pullingText: pullingText, releaseText: releaseText)
        ref_refreshFooter = TextFooter(textItem: textItem, height: height, action: action)
    }

    
    public func ref_setIndicatorAutoFooter(height: CGFloat = Default.short,
                                           action: @escaping () -> Void) {
        ref_refreshFooter = IndicatorFooter(height: height, isAuto: true, action: action)
    }

    
    public func ref_setTextAutoFooter(loadingText: String = Default.loadingText,
                                      height: CGFloat = Default.short,
                                      action: @escaping () -> Void) {
        let textItem = TextItem(loadingText: loadingText)
        ref_refreshFooter = TextFooter(textItem: textItem, height: height, isAuto: true, action: action)
    }

    
    public func ref_setCustomHeader(headerView: RefreshView) {
        ref_refreshHeader = headerView
    }

    
    public func ref_setCustomFooter(footerView: RefreshView) {
        ref_refreshFooter = footerView
    }
    
    
    public func ref_beginRefreshing() {
        ref_refreshHeader?.beginRefreshing()
    }
    
    
    public func ref_endRefreshing() {
        ref_refreshHeader?.endRefreshing()
        ref_refreshFooter?.endRefreshing()
    }

    
    public func ref_endRefreshingWithNoMoreData(message: String? = nil) {
        ref_refreshFooter?.endRefreshing { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.ref_refreshFooter?.removeFromSuperview()
            strongSelf.ref_refreshFooter = nil

            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = UIColor.black.withAlphaComponent(0.8)
            label.text = message
            label.sizeToFit()
            label.center = CGPoint(x: strongSelf.bounds.midX, y: strongSelf.contentSize.height + 24)
            strongSelf.addSubview(label)
        }
    }
}



struct Default {
    static let color: UIColor = UIColor.black.withAlphaComponent(0.8)
    static let font: UIFont = UIFont.systemFont(ofSize: 14)
    static let loadingText = "Loading..."
    static let pullingText = "Pull down to refresh"
    static let releaseText = "Release to refresh"
    static let pullingFooterText = "Pull up to load more"
    static let releaseFooterText = "Release to load more"
    static let high: CGFloat = 120
    static let short: CGFloat = 60
}
