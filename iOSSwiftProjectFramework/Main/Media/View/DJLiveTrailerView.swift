//
//  DJLiveTrailerView.swift
//  iOSSwiftProjectFramework
//
//  Created by fcn on 2020/9/21.
//  Copyright © 2020 hdj. All rights reserved.
//

import Foundation
import UIKit

let DJLiveTrailerViewHeight: CGFloat = 64


class DJLiveTrailerView: BaseView {
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        self.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.init(top: 8, left: 12, bottom: 8, right: 12))
        }
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.layer.masksToBounds = true
        // 加阴影
        return contentView
    }()
    
    private lazy var tipLab: UILabel = {
        let tipLab = UILabel()
        self.contentView.addSubview(tipLab)
        tipLab.font = UIFont.systemFont(ofSize: 13)
        tipLab.backgroundColor = RGB(255.0, 155.0, 165.0)
        tipLab.textColor = .white
        tipLab.text = "预告"
        tipLab.textAlignment = .center
        tipLab.snp.makeConstraints { (make) in
            make.width.equalTo(35)
            make.height.equalTo(20)
            make.left.equalTo(12)
            make.centerY.equalTo(self.contentView.snp_centerY)
        }
        tipLab.layer.cornerRadius = 3
        tipLab.layer.masksToBounds = true
        return tipLab
    }()
    
    private lazy var detailLab: UILabel = {
        let detailLab = UILabel()
        detailLab.text = "52场 >"
        detailLab.font = .systemFont(ofSize: 15)
        detailLab.textColor = .red
        detailLab.textAlignment = .right
        self.contentView.addSubview(detailLab)
        detailLab.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView.snp_centerY)
            make.right.equalTo(-12)
//            make.width.lessThanOrEqualTo(40)
        }
        return detailLab
    }()
    
    private lazy var titleLab: UILabel = {
        let titleLab = UILabel()
        titleLab.text = "NBA直播_nba直播吧_NBA视频在线直播 -【极速体育】"
        self.contentView.addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.contentView.snp_centerY)
            make.left.equalTo(self.tipLab.snp_right).offset(8)
            make.right.equalTo(self.detailLab.snp_left).offset(-8)
        }
        return titleLab
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.contentView.isHidden = false
        self.tipLab.isHidden = false
        self.detailLab.isHidden = false
        self.titleLab.isHidden = false

    }
}
