//
//  DJHotTableViewCell.swift
//  iOSSwiftProjectFramework
//
//  Created by fcn on 2020/9/23.
//  Copyright © 2020 hdj. All rights reserved.
//

import UIKit

let DJHotTableViewCellHeight_Top: CGFloat = 200
let DJHotTableViewCellHeight_Normal: CGFloat = 180

class DJHotTableViewCell: UITableViewCell {

    var isTop = false
    
    lazy var banner: UIImageView = {
        let banner = UIImageView()
        self.contentView.addSubview(banner)
        banner.contentMode = .scaleAspectFill
        banner.clipsToBounds = true
        banner.image = Image("placeholder")
        return banner
    }()
    
    lazy var titleLab: UILabel = {
        let titleLab = UILabel()
        self.contentView.addSubview(titleLab)
        return titleLab
    }()
    
    lazy var detailLab: UILabel = {
        let detailLab = UILabel()
        self.contentView.addSubview(detailLab)
        detailLab.font = systemFont(15)
        detailLab.textColor = .gray
        return detailLab
    }()
    
    lazy var timeLab: UILabel = {
        let timeLab = UILabel()
        timeLab.font = .systemFont(ofSize: 12)
        self.contentView.addSubview(timeLab)
        return timeLab
    }()
    
    lazy var numLab: UILabel = {
        let numLab = UILabel()
        self.contentView.addSubview(numLab)
        numLab.textColor = .white
        return numLab
    }()
    
    lazy var rankLab: UILabel = {
        let rankLab = UILabel()
        self.contentView.addSubview(rankLab)
        rankLab.textColor = .white
        return rankLab
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        NSLog("重新布局")
        if self.isTop {
            self.banner.snp.remakeConstraints { (make) in
                make.edges.equalTo(0)
            }
            self.banner.layer.cornerRadius = 0

            self.rankLab.snp.remakeConstraints { (make) in
                make.right.equalTo(self.banner.snp.right).offset(-15)
                make.bottom.equalTo(self.banner.snp.bottom).offset(-20)
            }

            self.numLab.snp.remakeConstraints { (make) in
                make.left.equalTo(self.banner.snp.left).offset(15)
                make.bottom.equalTo(self.banner.snp.bottom).offset(-10)
                make.width.height.equalTo(60)
            }
            numLab.font = .systemFont(ofSize: 50, weight: UIFont.Weight.bold)


            self.titleLab.snp.remakeConstraints { (make) in
                make.bottom.equalTo(self.numLab.snp.centerY).offset(0)
                make.left.equalTo(self.numLab.snp.right).offset(8)
                make.right.equalTo(-50)
            }
            
            self.detailLab.snp.remakeConstraints { (make) in
                make.top.equalTo(self.numLab.snp.centerY).offset(5)
                make.left.equalTo(self.titleLab.snp.left)
                make.right.equalTo(self.titleLab.snp.right)
            }

        }else{
            self.banner.snp.remakeConstraints { (make) in
                make.top.equalTo(10)
                make.left.equalTo(10)
                make.right.equalTo(-10)
                make.height.equalTo(DJHotTableViewCellHeight_Normal * 0.6)
            }
            self.banner.layer.cornerRadius = 8
            
            self.rankLab.snp.remakeConstraints { (make) in
                make.right.equalTo(self.banner.snp.right).offset(-15)
                make.bottom.equalTo(self.banner.snp.bottom).offset(-10)
            }

            self.numLab.snp.remakeConstraints { (make) in
                make.left.equalTo(self.banner.snp.left).offset(15)
                make.bottom.equalTo(self.banner.snp.bottom).offset(-10)
            }
            numLab.font = .systemFont(ofSize: 21, weight: UIFont.Weight.bold)

            self.timeLab.snp.remakeConstraints { (make) in
                make.width.equalTo(50)
                make.right.equalTo(-12)
                make.top.equalTo(self.banner.snp.bottom).offset(15)
            }

            self.titleLab.snp.remakeConstraints { (make) in
                make.top.equalTo(self.banner.snp.bottom).offset(12)
                make.left.equalTo(12)
                make.right.equalTo(self.timeLab.snp.left).offset(-12)
            }
            
            self.detailLab.snp.remakeConstraints { (make) in
                make.top.equalTo(self.titleLab.snp.bottom).offset(8)
                make.left.equalTo(12)
                make.right.equalTo(-12)
            }
        }
    }
    
}
