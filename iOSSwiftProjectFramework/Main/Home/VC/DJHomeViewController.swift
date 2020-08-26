//
//  DJHomeViewController.swift
//  iOSSwiftProjectFramework
//
//  Created by fcn on 2020/8/24.
//  Copyright © 2020 hdj. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import HandyJSON


class DJHomeViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, HomeSegmentViewDelegate {
    
    var newsList: [HomeListModel]?
    
    private lazy var bannerView: DJBannerView = {
        let bannerView = DJBannerView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: DJBannerViewHeight))
        return bannerView
    }()

    private lazy var segView: HomeSegmentView = {
        let segView = HomeSegmentView()
        self.view.addSubview(segView)
        segView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(0)
            make.height.equalTo(HomeSegmentViewHeight)
        }
        return segView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = UIEdgeInsets.zero
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.init(top: HomeSegmentViewHeight, left: 0, bottom: 0, right: 0))
        }
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white

        self.navButtonLeft.isHidden = true
        self.segView.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableHeaderView = self.bannerView
        
        responseData()

        
    }
    
    // MARK --
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model: HomeListModel = self.newsList![indexPath.row]
        let cell = DJNewsTableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.iconImageView.kf.setImage(with: URL(string: model.thumbnail_pic_s02), placeholder: Image("placeholder"), options: nil, progressBlock: nil) { (r) in }
        cell.titleLab.text = model.title
        cell.sourceLab.text = model.author_name
//        cell.detailLab.text = String(model.date[model.date.index(model.date.startIndex, offsetBy: 5)..<model.date.endIndex])
        cell.detailLab.text = model.date
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DJNewsTableViewCellHeight
    }
       
    
    // MARK -- HomeSegmentViewDelegate
    func itemDidSelected(_ index: Int) {
        self.segView.selectType = self.segView.dataSourcePY[index]
        responseData()
    }
    
    
    // MARK -- NetRequest
    func responseData() {
        BaseNetRequest.NetWorkRequest(.getNewsList(key: "", type: self.segView.selectType!), completion: { (JSOnDictory) -> (Void) in
            let dataArr =  JSOnDictory["result"]["data"].arrayObject
            if let arr = JSONDeserializer<HomeListModel>.deserializeModelArrayFrom(array: dataArr) {
                let t = arr.compactMap({$0})
                self.newsList = t
                self.tableView.reloadData()
            }
        }, failed: { (reason) -> (Void) in
            print("请求失败: \(reason)")
        }) { () -> (Void) in
            print("请求错误")
        }
    }
}
