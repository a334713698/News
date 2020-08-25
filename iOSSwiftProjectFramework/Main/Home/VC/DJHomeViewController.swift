//
//  DJHomeViewController.swift
//  iOSSwiftProjectFramework
//
//  Created by fcn on 2020/8/24.
//  Copyright © 2020 hdj. All rights reserved.
//

import UIKit

class DJHomeViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
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
        self.segView.isHidden = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableHeaderView = self.bannerView
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DJNewsTableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: nil)
        cell.titleLab.text = "标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题"
        cell.sourceLab.text = "1818黄金眼"
        cell.detailLab.text = "1432跟帖"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DJNewsTableViewCellHeight
    }

}
