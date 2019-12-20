//
//  HomeDetailViewController.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/17.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import UIKit

class HomeDetailViewController: BaseViewController {

    private let tableView = BaseTableView()
    private let dataSource = [
        "数据库指引 一级页面",
        "云开发 QuickStart 二级页面"
    ]
    private let paths = [
        "pages/databaseGuide/databaseGuide",//数据库指引
        "pages/im/room/room"                //云开发 QuickStart
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "拉起小程序指定页面"
        setUI()
    }

}

extension HomeDetailViewController {
    private func setUI() {
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BaseTableViewCell.self, forCellReuseIdentifier: BaseTableViewCell.LaunchMiniProgram_reuseIdentifier)
        view.addSubview(tableView)
    }
}

extension HomeDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BaseTableViewCell.createCell(tableView: tableView)
        cell.leftText = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        UIViewController.isWXAppSupport()
        HomeServiceManager.launchMiniProgramReq(ofPath: paths[indexPath.row])
    }
}

