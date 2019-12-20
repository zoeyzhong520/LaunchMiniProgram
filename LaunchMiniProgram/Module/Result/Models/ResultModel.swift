//
//  ResultModel.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/19.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import UIKit
import HandyJSON

struct ResultModel: HandyJSON {
    var name = ""
    var url = ""
    var page = 0
    var isNonProfit = true
    var address: ResultAddress?
    var links = [ResultLinks]()
}

struct ResultAddress: HandyJSON {
    var street = ""
    var city = ""
    var country = ""
}

struct ResultLinks: HandyJSON {
    var name = ""
    var url = ""
}
