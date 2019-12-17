//
//  BaseViewController.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/16.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}
