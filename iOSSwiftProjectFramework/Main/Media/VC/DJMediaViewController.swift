//
//  DJMediaViewController.swift
//  iOSSwiftProjectFramework
//
//  Created by fcn on 2020/9/3.
//  Copyright © 2020 hdj. All rights reserved.
//

import UIKit

class DJMediaViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, DJVideoCateViewDelegate {

    let dataArr = [
        "http://pic1.win4000.com/wallpaper/e/5382fbbe525fd.jpg",
        "http://pic1.win4000.com/wallpaper/e/5382fbb765eac.jpg",
        "http://pic1.win4000.com/wallpaper/e/5382fbc538bf0.jpg",
        "http://pic1.win4000.com/wallpaper/e/5382fbda9a261.jpg",
        "http://pic1.win4000.com/wallpaper/e/5382fbe16105f.jpg",
        "http://pic1.win4000.com/wallpaper/e/5382fbe85ba62.jpg",
        "http://pic1.win4000.com/wallpaper/e/5382fbef23c11.jpg",
        "http://pic1.win4000.com/wallpaper/e/5382fbf6cc39c.jpg",
        "http://pic1.win4000.com/wallpaper/e/5382fbfc9871f.jpg",
        "http://pic1.win4000.com/wallpaper/e/5382fc10796f2.jpg"
    ]
    
    let cateArr = ["TOP100","咨询","娱乐","体育","本地","汽车","科技","财经","健康","美食","大直播","在现场","星在线","纵横谈","星座系"]
    
    
    // prama MARK - Property
    private lazy var bannerView: DJMediaBannerView = {
        let bannerView = DJMediaBannerView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: DJMediaBannerViewHeight))
        return bannerView
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: UITableView.Style.grouped)
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorInset = UIEdgeInsets.zero
        if IOS11_OR_LATER {
            tableView.estimatedSectionHeaderHeight = 10
            tableView.estimatedSectionFooterHeight = 0.01
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(DJMediaTableViewCell.self, forCellReuseIdentifier: "mediaCell")
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        tableView.mj_header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(loadNewData))
        tableView.mj_footer = MJRefreshBackNormalFooter.init(refreshingTarget: self, refreshingAction: #selector(loadMoreData))
        return tableView
    }()
    
    private lazy var videoCateView: DJVideoCateView = {
        let videoCateView = DJVideoCateView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: (CateItemHeight + CateItemMargin) * CGFloat(ceilf(Float(self.cateArr.count) / 5.0)) + CateItemMargin))
        videoCateView.delegate = self
        videoCateView.cateArr = self.cateArr
        videoCateView.collectionView.reloadData()
        self.view.addSubview(videoCateView)
        return videoCateView
    }()
    
    lazy var referButton: UIButton = {
        var btn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: NavigationBarIconSize, height: NavigationBarIconSize))
        self.setupNavButton(btn, "  推荐  ")
        btn.addTarget(self, action: #selector(referButtonPressed), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    lazy var cateButton: UIButton = {
        var btn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: NavigationBarIconSize, height: NavigationBarIconSize))
        self.setupNavButton(btn, "  分类  ")
        btn.addTarget(self, action: #selector(cateButtonPressed), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    // prama MARK - VC life
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        self.tableView.isHidden = false
        self.setupNav()
    }

    // prama MARK - UITableViewDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArr.count * 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imgStr = self.dataArr[indexPath.section % self.dataArr.count]
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaCell", for: indexPath) as! DJMediaTableViewCell
        cell.contImageView.kf.setImage(with: URL(string: imgStr), placeholder: Image("placeholder"), options: nil, progressBlock: nil) { (r) in }
        return cell
    }
    
    // prama MARK - UITableViewDataSource
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return DJLiveTrailerViewHeight
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let view = DJLiveTrailerView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: DJLiveTrailerViewHeight))
            
            return view
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    // prama MARK - SEL
    @objc func referButtonPressed() {
        print("导航栏-推荐")
        self.cateButton.isSelected = false
        self.cateButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        self.referButton.isSelected = true
        self.referButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        self.videoCateView.isHidden = true
        self.tableView.tableHeaderView = self.bannerView
    }
    
    @objc func cateButtonPressed() {
        print("导航栏-分类")
        if self.cateButton.isSelected == true {
            self.videoCateView.isHidden = !self.videoCateView.isHidden
        }
        self.referButton.isSelected = false
        self.referButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        self.cateButton.isSelected = true
        self.cateButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
        self.tableView.tableHeaderView = nil
    }
    
    @objc func loadNewData() {
        self.tableView.mj_header?.endRefreshing()
    }
    
    @objc func loadMoreData() {
        self.tableView.mj_footer?.endRefreshingWithNoMoreData()
    }

    // MARK -- DJVideoCateViewDelegate
    func itemDidSelected(_ index: Int) {
        self.videoCateView.isHidden = true
        self.videoCateView.selectedIndex = index
        self.tableView.mj_header?.beginRefreshing()
    }

    // prama MARK - Method
    func setupNav() {
        self.navigationItem.titleView = UIView.init()
        self.navigationItem.setLeftBarButtonItems([UIBarButtonItem.init(customView: self.referButton), UIBarButtonItem.init(customView: self.cateButton)], animated: true)
        self.referButtonPressed()
    }
    
    func setupNavButton(_ btn: UIButton, _ title: String) {
        btn.titleLabel?.font = BOLD_FONT_SIZE_17
        btn.setTitle(title, for: UIControl.State.normal)
        btn.setTitle(title, for: UIControl.State.selected)
        btn.setTitleColor(RGB(245, 180, 180), for: UIControl.State.normal)
        btn.setTitleColor(.white, for: UIControl.State.selected)
    }
    

}
