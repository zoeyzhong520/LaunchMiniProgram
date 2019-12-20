//
//  UITableView+Ext.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/19.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import UIKit

extension UITableView {
    convenience init(frame: CGRect, backgroundColor: UIColor = UIColor.white, separatorStyle: UITableViewCell.SeparatorStyle = .none) {
        self.init()
        self.frame = frame
        self.backgroundColor = backgroundColor
        self.separatorStyle = separatorStyle
    }
    
    ///显示无数据页
    func showEmptyView(row: Int = 0) {
        if row == 0 {
            let ev = EmptyView()
            backgroundView = ev
        } else {
            backgroundView = nil
        }
    }
}

class BaseTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        backgroundColor = .white
        separatorStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
