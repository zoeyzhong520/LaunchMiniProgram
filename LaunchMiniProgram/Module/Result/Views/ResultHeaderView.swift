//
//  ResultHeaderView.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/19.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import UIKit

class ResultHeaderView: UIView {

    var model = ResultModel() {
        didSet {
            nameLabel.text = model.name
            addressView.model = model
        }
    }
    
    private let nameLabel = UILabel()
    private let checkBtn = UIButton(type: .system)
    private let addressView = ResultAddressView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ResultHeaderView {
    private func setUI() {
        backgroundColor = .white
        
        nameLabel.textAlignment = .center
        nameLabel.frame = CGRect(x: 0, y: defaultMargin, width: bounds.size.width, height: 20)
        addSubview(nameLabel)
        
        checkBtn.frame = CGRect(x: 0, y: nameLabel.frame.maxY, width: bounds.size.width, height: 50)
        checkBtn.setTitle("点击查看", for: .normal)
        checkBtn.addTarget(self, action: #selector(checkAction), for: .touchUpInside)
        addSubview(checkBtn)
        
        addressView.frame = CGRect(x: defaultMargin, y: checkBtn.frame.maxY, width: bounds.size.width-defaultMargin*2, height: bounds.size.height-20-20-50-defaultMargin)
        addSubview(addressView)
    }
    
    @objc private func checkAction() {
        BaseHtmlController.showHtml(htmlString: model.url)
    }
}

class ResultAddressView: UIView {
    
    var model = ResultModel() {
        didSet {
            setUI()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.masksToBounds = true
        layer.cornerRadius = 5
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.3
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        let items = [model.address?.street, model.address?.city, model.address?.country]
        let itemWidth = bounds.size.width
        let itemHeight = bounds.size.height/3
        for i in 0..<items.count {
            let label = UILabel(text: items[i], font: UIFont.systemFont(ofSize: 16), textColor: .black, textAlignment: .center)
            label.frame = CGRect(x: 0, y: CGFloat(i)*itemHeight, width: itemWidth, height: itemHeight)
            addSubview(label)
        }
    }
}

