//
//  BaseTableViewCell.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/19.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    var leftText: String? {
        didSet {
            leftLabel.text = leftText
        }
    }
    
    private let leftLabel = UILabel()
    private let line = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension BaseTableViewCell {
    private func setUI() {
        leftLabel.frame = CGRect(x: defaultMargin, y: 0, width: UIScreen.width-defaultMargin, height: contentView.bounds.size.height)
        contentView.addSubview(leftLabel)
        
        line.frame = CGRect(x: defaultMargin, y: contentView.bounds.size.height, width: UIScreen.width-defaultMargin, height: 0.3)
        line.backgroundColor = .lightGray
        contentView.addSubview(line)
    }
    
    static var LaunchMiniProgram_reuseIdentifier: String {
        return String(describing: self)
    }
    
    class func createCell(tableView: UITableView) -> BaseTableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LaunchMiniProgram_reuseIdentifier) as? BaseTableViewCell else {
            return BaseTableViewCell(style: .default, reuseIdentifier: LaunchMiniProgram_reuseIdentifier)
        }
        return cell
    }
}
