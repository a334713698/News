//
//  DJBannerView.swift
//  iOSSwiftProjectFramework
//
//  Created by fcn on 2020/8/25.
//  Copyright © 2020 hdj. All rights reserved.
//

import UIKit

let DJBannerViewHeight: CGFloat = 188

class DJBannerView: BaseView {

    var dataSource = [
        "https://img.zcool.cn/community/011f29597890fea8012193a3ec4d2d.jpg@2o.jpg",
        "https://img.zcool.cn/community/011f29597890fea8012193a3ec4d2d.jpg@2o.jpg",
        "https://img.zcool.cn/community/011f29597890fea8012193a3ec4d2d.jpg@2o.jpg",
        "https://img.zcool.cn/community/011f29597890fea8012193a3ec4d2d.jpg@2o.jpg",
        "https://img.zcool.cn/community/011f29597890fea8012193a3ec4d2d.jpg@2o.jpg"
    ]
    
    var titleLab: UILabel!

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
        self.scrollerView.contentSize = CGSize.init(width: SCREEN_WIDTH * CGFloat(self.dataSource.count), height: DJBannerViewHeight)
        for (i, v) in dataSource.enumerated() {
            let imageView: UIImageView = UIImageView.init(frame: CGRect.init(x: CGFloat(i) * SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: DJBannerViewHeight))
            self.scrollerView.addSubview(imageView)
            imageView.kf.setImage(with: URL(string: v))
        }
        
        let pageControl = UIPageControl.init()
        self.addSubview(pageControl)
        pageControl.snp.makeConstraints { (make) in
            make.right.equalTo(-12)
            make.bottom.equalTo(0)
            make.height.equalTo(30)
        }
        pageControl.numberOfPages = self.dataSource.count
        
        self.titleLab = UILabel()
        self.titleLab.textColor = .white
        self.titleLab.text = "小米：为发烧而生"
        self.addSubview(self.titleLab)
        self.titleLab.snp.makeConstraints { (make) in
            make.left.equalTo(12)
            make.bottom.equalTo(-3)
            make.height.equalTo(30)
        }
        
        
    }

}
