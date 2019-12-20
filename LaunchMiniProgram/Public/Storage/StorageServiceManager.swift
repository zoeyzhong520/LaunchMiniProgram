//
//  StorageServiceManager.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/19.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import UIKit

private let CachedJSONKey = "CachedJSONKey"

class StorageServiceManager: NSObject {
    private override init() {}
    static let `default` = StorageServiceManager()
    
    ///缓存的JSON
    var cachedJSON: String {
        get {
            return (UserDefaults.standard.value(forKey: CachedJSONKey) as? String) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: CachedJSONKey)
        }
    }
    
    ///检查是否有本地缓存JSON
    var isCached: Bool {
        return !StorageServiceManager.default.cachedJSON.isEmpty
    }
}
