//
//  DJHotViewController.swift
//  iOSSwiftProjectFramework
//
//  Created by fcn on 2020/9/22.
//  Copyright © 2020 hdj. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import HandyJSON

class DJHotViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var newsList = [HomeListModel]()

    // prama MARK - Property
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: UITableView.Style.grouped)
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorInset = UIEdgeInsets.zero
        if IOS11_OR_LATER {
            tableView.estimatedSectionHeaderHeight = 10
            tableView.estimatedSectionFooterHeight = 0.01
        }
        tableView.register(DJHotTableViewCell.self, forCellReuseIdentifier: "hotCell")
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        return tableView
    }()
    
    // prama MARK - VC life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        self.navButtonLeft.isHidden = true
        self.tableView.isHidden = false
        self.responseData()
    }
    
    // prama MARK - UITableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.newsList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hotCell", for: indexPath) as! DJHotTableViewCell
        cell.isTop = indexPath.section == 0
        cell.layoutIfNeeded()
        
        let model: HomeListModel = self.newsList[indexPath.section]
        cell.banner.kf.setImage(with: URL(string: model.thumbnail_pic_s02), placeholder: Image("placeholder"), options: nil, progressBlock: nil) { (r) in }
        cell.titleLab.text = model.title
        cell.detailLab.text = model.author_name
        cell.timeLab.text = String(model.date[model.date.index(model.date.endIndex, offsetBy: -5)..<model.date.endIndex])
        cell.numLab.text = String.init(format: "%02d", indexPath.section + 1)
        let rankText = (indexPath.section%2 == 0) ? "↑ \(arc4random_uniform(10))":"↓ \(arc4random_uniform(10))"
        let attributedText = NSMutableAttributedString.init(string: rankText)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: (indexPath.section%2 == 0) ? UIColor.red:UIColor.green, range: NSRange.init(location: 0, length: 1))
        cell.rankLab.attributedText = attributedText
        return cell
    }
    
    // prama MARK - UITableViewDataSource
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return DJHotTableViewCellHeight_Top
        }
        return DJHotTableViewCellHeight_Normal
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }

    // MARK -- NetRequest
    func responseData() {
        BaseNetRequest.NetWorkRequest(.getNewsList(key: "", type: "娱乐"), completion: { (JSOnDictory) -> (Void) in
            self.tableView.mj_header?.endRefreshing()
            self.tableView.mj_footer?.endRefreshing()
            let dataArr =  JSOnDictory["result"]["data"].arrayObject
            if let arr = JSONDeserializer<HomeListModel>.deserializeModelArrayFrom(array: dataArr) {
                let t = arr.compactMap({$0})
                self.newsList += t
                self.tableView.reloadData()
            }
        }, failed: { (reason) -> (Void) in
            print("请求失败: \(reason)")
        }) { () -> (Void) in
            print("请求错误")
        }
    }

}
