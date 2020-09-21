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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.contentView.isHidden = false
        
    }
}
