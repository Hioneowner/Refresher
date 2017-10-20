//
//  TextItem.swift
//  Refresher
//
//  Created by MingChen on 2017/10/20.
//  Copyright © 2017年 MingChen. All rights reserved.
//

import UIKit

final class TextItem {
    private let loadingText: String
    
    private let pullingText: String
    
    private let releaseText: String
    
    let label = UILabel()

    init(loadingText: String, pullingText: String = "", releaseText: String = "") {
        self.loadingText = loadingText
        self.pullingText = pullingText
        self.releaseText = releaseText

        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.black.withAlphaComponent(0.8)
    }

    func didUpdateState(_ isRefreshing: Bool) {
        label.text = isRefreshing ? loadingText : pullingText
        label.sizeToFit()
    }

    func didUpdateProgress(_ progress: CGFloat) {
        label.text = progress == 1 ? releaseText : pullingText
        label.sizeToFit()
    }
}
