//
//  NSObject+Ext.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/17.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import UIKit

extension NSObject {
    ///检测是否安装微信客户端
    class func isWXAppSupport() {
        if !WXApi.isWXAppSupport() {
            UIViewController.getTopViewController()?.showAlert(title: "提示", message: "设备未安装微信客户端", buttonTitles: nil)
            return
        }
    }
}
