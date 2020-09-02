//
//  DJMeHeaderView.swift
//  iOSSwiftProjectFramework
//
//  Created by fcn on 2020/9/2.
//  Copyright © 2020 hdj. All rights reserved.
//

import UIKit

class DJMeHeaderView: BaseView {

    let dataSource = [
        [Key_Title: "收藏", Key_Img: "me_collocation", Key_Type: DJMeType.Collection],
        [Key_Title: "评论", Key_Img: "me_comment", Key_Type: DJMeType.Comment],
        [Key_Title: "我的卡包", Key_Img: "me_card", Key_Type: DJMeType.CardPackage],
        [Key_Title: "积分商城", Key_Img: "me_mall", Key_Type: DJMeType.IntegralMall],
    ]

    private lazy var loginBtn: UIButton = {
        let loginBtn = UIButton()
        self.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(adaptWidth(150))
            make.centerX.equalTo(self.snp_centerXWithinMargins)
            make.centerY.equalTo(self.snp_centerYWithinMargins).offset(-adaptWidth(75)/2)
        }
        loginBtn.setImage(Image("me_login"), for: UIControl.State.normal)
        loginBtn.setTitle("登录账号", for: UIControl.State.normal)
        loginBtn.layoutButton(edgeInsetsStyle: GGButtonEdgeInsetsStyle.Top, imageTitleSpace: 8)
        return loginBtn
    }()
    
    private lazy var bottomView: UIView = {
        let h = adaptWidth(75)
        let bottomView = UIView()
        bottomView.backgroundColor = RGB(255.0, 75.0, 77.0)
        self.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(0)
            make.height.equalTo(h)
        }
        let margin = (SCREEN_WIDTH - CGFloat(self.dataSource.count) * h) / CGFloat(self.dataSource.count + 1)
        for (index, item) in self.dataSource.enumerated() {
            let data = self.dataSource[index]
            let btn = UIButton.init(frame: CGRect.init(x: margin + CGFloat(index) * (margin + h), y: 0, width: h, height: h))
            bottomView.addSubview(btn)
            btn.titleLabel?.font = FONT_SIZE_14
            btn.setTitle(data[Key_Title] as? String, for: UIControl.State.normal)
            btn.setImage(Image(data[Key_Img] as! String), for: UIControl.State.normal)
            btn.layoutButton(edgeInsetsStyle: GGButtonEdgeInsetsStyle.Top, imageTitleSpace: adaptWidth(5))
        }

        return bottomView
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = MAIN_COLOR
        self.bottomView.isHidden = false
        self.loginBtn.isHidden = false
    }
}
