//
//  EmptyView.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/19.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import UIKit
import Kingfisher

class EmptyView: UIView {

    private let imgView = UIImageView()
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension EmptyView {
    private func setUI() {
        backgroundColor = UIColor(red: 251/255.0, green: 251/255.0, blue: 251/255.0, alpha: 1)
        
        if let path = Bundle.main.path(forResource: "noData_default_icon", ofType: "gif") {
            imgView.kf.setImage(with: ImageResource(downloadURL: URL(fileURLWithPath: path)))
        }
        
        imgView.frame = CGRect(x: 0, y: 0, width: 300, height: 225)
        imgView.center = center
        addSubview(imgView)
    }
}
