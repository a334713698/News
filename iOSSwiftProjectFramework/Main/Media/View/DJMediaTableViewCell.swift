//
//  DJMediaTableViewCell.swift
//  iOSSwiftProjectFramework
//
//  Created by fcn on 2020/9/18.
//  Copyright © 2020 hdj. All rights reserved.
//

import UIKit

class DJMediaTableViewCell: UITableViewCell {

    lazy var contImageView: UIImageView = {
        let contImageView = UIImageView()
        self.addSubview(contImageView)
        contImageView.clipsToBounds = true
        contImageView.contentMode = .scaleAspectFill
        contImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        return contImageView
    }()
    
    private lazy var liveIcon: UIButton = {
        let liveIcon = UIButton()
        self.addSubview(liveIcon)
        liveIcon.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        liveIcon.backgroundColor = .red
        liveIcon.setTitle(" 直播", for: UIControl.State.normal)
        liveIcon.setImage(Image("icon_live"), for: UIControl.State.normal)
        liveIcon.contentHorizontalAlignment = .center
        liveIcon.snp.makeConstraints { (make) in
            make.left.equalTo(12)
            make.bottom.equalTo(-8)
            make.size.equalTo(CGSize.init(width: 55, height: 20))
        }
        liveIcon.layer.cornerRadius = 5
        liveIcon.layer.masksToBounds = true
        return liveIcon
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.bottom.equalTo(self.snp_bottom).offset(-8-20-8)
        }
        titleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        titleLabel.textColor = .white
        return titleLabel
    }()
    
    private lazy var countLabel: UILabel = {
        let countLabel = UILabel()
        countLabel.textColor = .white
        countLabel.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(countLabel)
        countLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.liveIcon.snp_centerY);
            make.left.equalTo(self.liveIcon.snp_right).offset(8);
            make.height.equalTo(20)
        }
        countLabel.layer.cornerRadius = 5
        countLabel.layer.masksToBounds = true
        countLabel.layer.borderColor = UIColor.white.cgColor
        countLabel.layer.borderWidth = 1.0
        return countLabel
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contImageView.isHidden = false
        self.liveIcon.isHidden = false
        self.titleLabel.addShadowText("旅游直播，足不出户“云旅游”")
        self.countLabel.addShadowText(" 6666参与 ")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
