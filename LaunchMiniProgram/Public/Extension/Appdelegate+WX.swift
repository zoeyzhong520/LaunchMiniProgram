//
//  Appdelegate+WX.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/16.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import Foundation

extension AppDelegate {
    func registerWX() {
        WXApi.registerApp(WXAppId)
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        print("===", url, "\n", url.host ?? "", "===")
        return WXApi.handleOpen(url, delegate: self)
    }
}

extension AppDelegate: WXApiDelegate {
    func onResp(_ resp: BaseResp!) {
        if let miniProgram = resp as? WXLaunchMiniProgramResp {
            let msg = miniProgram.extMsg
            
            UIViewController.getTopViewController()?.showAlert(title: "小程序向app传值", message: msg, buttonTitles: nil, completion: { (_) in
                //播放一段雪花动效
//                UIView.showSnowAnimation(duration: 3)
                
                ResultServiceManager.showResultController(jsonString: msg)
            })
        }
    }
}
