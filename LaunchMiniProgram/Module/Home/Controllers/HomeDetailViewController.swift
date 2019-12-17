//
//  HomeDetailViewController.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/17.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cellID"

class HomeDetailViewController: BaseViewController {

    private let tableView = UITableView()
    private let dataSource = [
        "数据库指引 一级页面",
        "云开发 QuickStart 二级页面"
    ]
    private let paths = [
        "pages/databaseGuide/databaseGuide",
        "pages/im/room/room"
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
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
    }
}

extension HomeDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) else {
            fatalError("dequeue reusable cell failed with identifier \(reuseIdentifier)")
        }
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIViewController.isWXAppSupport()
        HomeServiceManager.launchMiniProgramReq(ofPath: paths[indexPath.row])
    }
}

