//
//  IndicatorItem.swift
//  Refresher
//
//  Created by MingChen on 2017/10/20.
//  Copyright © 2017年 MingChen. All rights reserved.
//

import UIKit

final class IndicatorItem {
    lazy var arrowLayer: CAShapeLayer = {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 8))
        path.addLine(to: CGPoint(x: 0, y: -8))
        path.move(to: CGPoint(x: 0, y: 8))
        path.addLine(to: CGPoint(x: 5.66, y: 2.34))
        path.move(to: CGPoint(x: 0, y: 8))
        path.addLine(to: CGPoint(x: -5.66, y: 2.34))

        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = UIColor.black.withAlphaComponent(0.8).cgColor
        layer.lineWidth = 2
        layer.lineCap = kCALineCapRound
        return layer
    }()

    let indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)

    func didUpdateState(_ isRefreshing: Bool) {
        arrowLayer.isHidden = isRefreshing
        isRefreshing ? indicator.startAnimating() : indicator.stopAnimating()
    }

    func didUpdateProgress(_ progress: CGFloat, isFooter: Bool = false) {
        if isFooter {
            arrowLayer.transform = progress == 1 ? CATransform3DIdentity : CATransform3DMakeRotation(CGFloat.pi, 0, 0, 1)
        } else {
            arrowLayer.transform = progress == 1 ? CATransform3DMakeRotation(CGFloat.pi, 0, 0, 1) : CATransform3DIdentity
        }
    }
}
