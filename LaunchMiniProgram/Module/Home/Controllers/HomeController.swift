//
//  ViewController.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/16.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import UIKit

class HomeController: BaseViewController {
    
    private let tableView = BaseTableView()
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BaseTableViewCell.self, forCellReuseIdentifier: BaseTableViewCell.LaunchMiniProgram_reuseIdentifier)
        view.addSubview(tableView)
        
        createFooterView()
    }
    
    private func createFooterView() {
        if !StorageServiceManager.default.isCached {
            return
        }
        let footer = UIButton(frame: CGRect(x: defaultMargin, y: UIScreen.height-34-40, width: UIScreen.width-defaultMargin*2, height: 40), backgroundColor: .white)
        footer.setTitle("查看本地JSON", for: .normal)
        footer.setTitleColor(.black, for: .normal)
        footer.setTitleColor(.gray, for: .highlighted)
        footer.setBorderStyle(borderWidth: 0.3, borderColor: UIColor.lightGray.cgColor, cornerRadius: 20)
        footer.addTarget(self, action: #selector(checkCachedJSON), for: .touchUpInside)
        view.addSubview(footer)
    }
    
    @objc private func checkCachedJSON() {
        HomeServiceManager.checkCachedJSON()
    }
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
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

