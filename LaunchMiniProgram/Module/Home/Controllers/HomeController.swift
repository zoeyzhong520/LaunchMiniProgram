//
//  ViewController.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/16.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cellID"

class HomeController: BaseViewController {
    
    private let tableView = UITableView()
    private let dataSource = ["拉起小程序首页", "拉起小程序指定页面"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "app、小程序互相调用"
        setUI()
    }
}

extension HomeController {
    private func setUI() {
        tableView.frame = view.bounds
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
    }
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
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
        if indexPath.row == 0 {
            UIViewController.isWXAppSupport()
            //拉起小程序首页
            HomeServiceManager.launchMiniProgramReq()
        } else {
            //拉起小程序指定页面
            navigationController?.pushViewController(HomeDetailViewController(), animated: true)
        }
    }
}

