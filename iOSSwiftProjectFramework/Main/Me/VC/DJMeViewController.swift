//
//  DJMeViewController.swift
//  iOSSwiftProjectFramework
//
//  Created by fcn on 2020/8/24.
//  Copyright © 2020 hdj. All rights reserved.
//

import UIKit


class DJMeViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        tableView.tableHeaderView = self.headerView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MeCell")
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        return tableView
    }()
    
    private lazy var headerView: DJMeHeaderView = {
        let headerView = DJMeHeaderView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: adaptWidth(275)))
        return headerView
    }()
    
    let dataSource = [
        [
            [Key_Title: "夜间模式", Key_Img: "me_nightmode", Key_Type: DJMeType.NightMode],
            [Key_Title: "离线下载", Key_Img: "me_download", Key_Type: DJMeType.OffLineDownload],
            [Key_Title: "新闻推送", Key_Img: "me_push", Key_Type: DJMeType.NewsPush],
            [Key_Title: "最近阅读", Key_Img: "me_recently", Key_Type: DJMeType.RecentlyRead],
        ],
        [
            [Key_Title: "意见反馈", Key_Img: "me_feedback", Key_Type: DJMeType.Feedback],
            [Key_Title: "设置", Key_Img: "me_setting", Key_Type: DJMeType.Setting],
        ],
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white

        self.navButtonLeft.isHidden = true
        self.tableView.isHidden = false
    }
    
    //pram - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = dataSource[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MeCell", for: indexPath)
        cell.textLabel?.text = data[Key_Title] as? String
        cell.imageView?.image = Image(data[Key_Img] as! String)
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        return cell
    }
    
    
    //pram - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }

}
