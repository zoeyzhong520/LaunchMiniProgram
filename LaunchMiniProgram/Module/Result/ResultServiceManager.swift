//
//  ResultServiceManager.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/19.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import Foundation

class ResultServiceManager {
    ///获取全部结果
    static func getResults(jsonString: String?, success: @escaping (ResultModel) -> Void, failed: @escaping (String) -> Void) {
        guard let model = ResultModel.deserialize(from: jsonString) else {
            failed("JSON解析失败")
            return
        }
        success(model)
    }
    
    ///打开ResultController
    static func showResultController(jsonString: String? = nil) {
        if let cachedJSON = jsonString {
            StorageServiceManager.default.cachedJSON = cachedJSON
        }
        let vc = ResultController(jsonString: jsonString)
        UIViewController.getTopViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
