//
//  DJNewsTableViewCell.swift
//  iOSSwiftProjectFramework
//
//  Created by fcn on 2020/8/25.
//  Copyright © 2020 hdj. All rights reserved.
//

import UIKit

let DJNewsTableViewCellHeight = adaptWidth(110)


class DJNewsTableViewCell: UITableViewCell {

    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        self.contentView.addSubview(iconImageView)
        iconImageView.backgroundColor = .red
        iconImageView.snp.makeConstraints { (make) in
            make.left.equalTo(8)
            make.centerY.equalTo(iconImageView.superview!.snp_centerYWithinMargins)
            make.width.equalTo(adaptWidth(120))
            make.height.equalTo(adaptWidth(90))
        }
        return iconImageView
    }()
    
    var titleLab: UILabel!
    var sourceLab: UILabel!
    var detailLab: UILabel!

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
        self.iconImageView.isHighlighted = false
        
        self.titleLab = UILabel()
        self.contentView.addSubview(self.titleLab)
        self.titleLab.font = BOLD_FONT_SIZE_17
        self.titleLab.numberOfLines = 2
        self.titleLab.snp.makeConstraints { (make) in
            make.top.equalTo(self.iconImageView.snp_top).offset(4)
            make.right.equalTo(-8)
            make.left.equalTo(self.iconImageView.snp_right).offset(8)
        }
        
        self.sourceLab = UILabel()
        self.contentView.addSubview(self.sourceLab)
        self.sourceLab.font = FONT_SIZE_12
        self.sourceLab.textColor = .lightGray
        self.sourceLab.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.iconImageView.snp_bottom).offset(-4)
            make.left.equalTo(self.iconImageView.snp_right).offset(8)
        }

        self.detailLab = UILabel()
        self.contentView.addSubview(self.detailLab)
        self.detailLab.font = FONT_SIZE_12
        self.detailLab.textColor = .lightGray
        self.detailLab.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.iconImageView.snp_bottom).offset(-4)
            make.right.equalTo(-8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
