//
//  UIViewController+Ext.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/17.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import UIKit

extension UIViewController {
    ///显示弹框
    func showAlert(title: String?, message: String?, buttonTitles: [String]?, completion: ((Int) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        var allButtons = buttonTitles ?? [String]()
        if allButtons.isEmpty {
            allButtons.append("OK")
        }
        
        for index in 0..<allButtons.count {
            alert.addAction(UIAlertAction(title: allButtons[index], style: .default, handler: { (_) in
                completion?(index)
            }))
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    ///获取顶层控制器
    class func getTopViewController(_ base: UIViewController? = UIWindow.getCurrentWindow()?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            let top = getTopViewController(nav.visibleViewController)
            return top
        }
        
        if let tab = base as? UITabBarController {
            let top = getTopViewController(tab.selectedViewController)
            return top
        }
        
        if let presented = base?.presentingViewController {
            let top = getTopViewController(presented)
            return top
        }
        
        return base
    }
}

extension UIWindow {
    ///获取顶层window
    class func getCurrentWindow() -> UIWindow? {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return appDelegate?.window
    }
}
