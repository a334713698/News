//
//  DJMediaViewController.swift
//  iOSSwiftProjectFramework
//
//  Created by fcn on 2020/9/3.
//  Copyright © 2020 hdj. All rights reserved.
//

import UIKit

class DJMediaViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

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
    
    // prama MARK - Property
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
        return tableView
    }()
    
    private lazy var videoCateView: DJVideoCateView = {
        let videoCateView = DJVideoCateView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 75))
        self.view.addSubview(videoCateView)
        return videoCateView
    }()
    
    lazy var videoButton: UIButton = {
        var btn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: NavigationBarIconSize, height: NavigationBarIconSize))
        self.setupNavButton(btn, "  视频  ")
        btn.isSelected = true
        btn.addTarget(self, action: #selector(videoButtonPressed), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    lazy var lifeButton: UIButton = {
        var btn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: NavigationBarIconSize, height: NavigationBarIconSize))
        self.setupNavButton(btn, "  直播  ")
        btn.addTarget(self, action: #selector(lifeButtonPressed), for: UIControl.Event.touchUpInside)
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    // prama MARK - SEL
    @objc func videoButtonPressed() {
        print("导航栏-视频")
        self.videoButton.isSelected = true
        self.lifeButton.isSelected = false
        self.videoCateView.isHidden = !self.videoCateView.isHidden
    }
    
    @objc func lifeButtonPressed() {
        print("导航栏-直播")
        self.lifeButton.isSelected = true
        self.videoButton.isSelected = false
        self.videoCateView.isHidden = true
    }


    // prama MARK - Method
    func setupNav() {
        self.title = ""
        self.navigationItem.setLeftBarButtonItems([UIBarButtonItem.init(customView: self.videoButton), UIBarButtonItem.init(customView: self.lifeButton)], animated: true)
    }
    
    func setupNavButton(_ btn: UIButton, _ title: String) {
        btn.titleLabel?.font = BOLD_FONT_SIZE_17
        btn.setTitle(title, for: UIControl.State.normal)
        btn.setTitle(title, for: UIControl.State.selected)
        btn.setTitleColor(RGB(245, 180, 180), for: UIControl.State.normal)
        btn.setTitleColor(.white, for: UIControl.State.selected)
    }
}
