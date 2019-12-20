//
//  ResultController.swift
//  LaunchMiniProgram
//
//  Created by 仲召俊 on 2019/12/19.
//  Copyright © 2019 zhongzj. All rights reserved.
//

import UIKit
import SVProgressHUD

class ResultController: BaseViewController {

    private let tableView = BaseTableView()
    private let resultHeaderView = ResultHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.width, height: UIScreen.width*0.618))
    private var model = ResultModel() {
        didSet {
            resultHeaderView.model = model
        }
    }
    
    init(jsonString: String?) {
        super.init(nibName: nil, bundle: nil)
        getModel(jsonString)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "展示结果"
        setUI()
    }

}

extension ResultController {
    private func setUI() {
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BaseTableViewCell.self, forCellReuseIdentifier: BaseTableViewCell.LaunchMiniProgram_reuseIdentifier)
        view.addSubview(tableView)
    }
    
    private func getModel(_ jsonString: String?) {
        ResultServiceManager.getResults(jsonString: jsonString, success: { [weak self] (model) in
            guard let `self` = self else {return}
            self.model = model
            self.tableView.tableHeaderView = self.resultHeaderView
            self.tableView.reloadData()
            self.tableView.showEmptyView(row: model.links.count)
        }) { [weak self] (_) in
            guard let `self` = self else {return}
            self.tableView.tableHeaderView = nil
            self.tableView.showEmptyView()
        }
    }
}

extension ResultController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.links.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BaseTableViewCell.createCell(tableView: tableView)
        cell.leftText = model.links[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        BaseHtmlController.showHtml(htmlString: model.links[indexPath.row].url)
    }
}
