//
//  UIView+Ext.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/16.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import UIKit

extension UIView {
    convenience init(frame: CGRect, backgroundColor: UIColor? = .white) {
        self.init()
        self.backgroundColor = backgroundColor
    }
    
    ///设置layer的border属性
    func setBorderStyle(borderWidth: CGFloat = 0, borderColor: UIColor = .clear, cornerRadius: CGFloat = 0) {
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}
