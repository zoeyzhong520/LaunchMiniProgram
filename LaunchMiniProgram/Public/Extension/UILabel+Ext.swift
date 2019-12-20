//
//  UILabel+Ext.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/19.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text: String?, font: UIFont?, textColor: UIColor?, textAlignment: NSTextAlignment = .left) {
        self.init()
        self.text = text
        self.textAlignment = textAlignment
        
        if let `textColor` = textColor {
            self.textColor = textColor
        }
        
        if let `font` = font {
            self.font = font
        }
    }
}
