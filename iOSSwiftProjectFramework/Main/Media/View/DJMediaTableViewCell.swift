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
        self.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
