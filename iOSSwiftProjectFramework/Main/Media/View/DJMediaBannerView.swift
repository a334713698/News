//
//  DJMediaBannerView.swift
//  iOSSwiftProjectFramework
//
//  Created by fcn on 2020/8/25.
//  Copyright © 2020 hdj. All rights reserved.
//

import UIKit

let DJMediaBannerViewHeight: CGFloat = 188

class DJMediaBannerView: BaseView {

    var dataSource = [
        "http://img.improve-yourmemory.com/pic/37b11785c00336ef0e86cf98831d861d-1.jpg",
    ]
    
    var titleBtn: UIButton!
    var titleLab: UILabel!
    var indexLab: UILabel!

    private lazy var scrollerView: UIScrollView = {
        let scrollerView = UIScrollView()
        self.addSubview(scrollerView)
        scrollerView.isPagingEnabled = true
        scrollerView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
        }
        return scrollerView
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.scrollerView.isHidden = false
        self.scrollerView.contentSize = CGSize.init(width: SCREEN_WIDTH * CGFloat(self.dataSource.count), height: DJMediaBannerViewHeight)
        for (i, v) in dataSource.enumerated() {
            let imageView: UIImageView = UIImageView.init(frame: CGRect.init(x: CGFloat(i) * SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: DJMediaBannerViewHeight))
            self.scrollerView.addSubview(imageView)
            imageView.kf.setImage(with: URL(string: v))
            imageView.kf.setImage(with: URL(string: v), placeholder: Image("placeholder"), options: nil, progressBlock: nil) { (r) in
                
            }
        }
        
        self.indexLab = UILabel()
        self.indexLab.text = "  1 / 1  "
        self.indexLab.textColor = .white
        self.indexLab.layer.cornerRadius = 10
        self.indexLab.layer.masksToBounds = true
        self.indexLab.backgroundColor = UIColor.init(white: 1.0, alpha: 0.6)
        self.indexLab.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(self.indexLab)
        self.indexLab.snp.makeConstraints { (make) in
            make.right.equalTo(-12)
            make.bottom.equalTo(-8)
            make.height.equalTo(20)
        }

        self.titleBtn = UIButton()
        self.addSubview(self.titleBtn)
        self.titleBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        self.titleBtn.backgroundColor = RGB(255.0, 155.0, 165.0)
        self.titleBtn.setTitle("回顾", for: UIControl.State.normal)
        self.titleBtn.setImage(Image("icon_live"), for: UIControl.State.normal)
        self.titleBtn.contentHorizontalAlignment = .center
        self.titleBtn.snp.makeConstraints { (make) in
            make.left.equalTo(12)
            make.bottom.equalTo(-12)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }
        self.titleBtn.layer.cornerRadius = 3
        self.titleBtn.layer.masksToBounds = true
        self.titleBtn.sizeToFit()
        self.titleBtn.layoutButton(edgeInsetsStyle: .Right, imageTitleSpace: 0)

        
        self.titleLab = UILabel()
        self.titleLab.textColor = .white
        self.titleLab.text = "直播，是一种生活态度。"
        self.addSubview(self.titleLab)
        self.titleLab.snp.makeConstraints { (make) in
            make.left.equalTo(self.titleBtn.snp_right).offset(5)
            make.centerY.equalTo(self.titleBtn.snp_centerY)
        }
    }

}
