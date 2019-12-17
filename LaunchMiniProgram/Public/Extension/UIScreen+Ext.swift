//
//  UIScreen+Ext.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/16.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import UIKit

extension UIScreen {
    static var width: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    static var height: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    static var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height
    }
    
    static var navigationBarStatusBarHeight: CGFloat {
        return statusBarHeight + navigationBarHeight
    }
    
    static var navigationBarHeight: CGFloat {
        return 44
    }
}
