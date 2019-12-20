//
//  HomeServiceManager.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/16.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import UIKit

class HomeServiceManager {
    ///拉起小程序首页
    static func launchMiniProgramReq(ofPath path: String = "") {
        let req = WXLaunchMiniProgramReq.object()
        req?.userName = MiniProgramID
        req?.path = path
        req?.miniProgramType = .test
        WXApi.send(req)
    }
    
    ///检查本地JSON缓存
    static func checkCachedJSON() {
        ResultServiceManager.showResultController(jsonString: StorageServiceManager.default.cachedJSON)
    }
}

extension HomeServiceManager {
    ///原始ID: gh_ca59958cf51b  盖世汽车资讯
    static let MiniProgramID = "gh_ca59958cf51b"
}
