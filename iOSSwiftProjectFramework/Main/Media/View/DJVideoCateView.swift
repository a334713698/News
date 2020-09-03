//
//  DJVideoCateView.swift
//  iOSSwiftProjectFramework
//
//  Created by fcn on 2020/9/3.
//  Copyright © 2020 hdj. All rights reserved.
//

import UIKit

class DJVideoCateView: BaseView, UICollectionViewDelegate, UICollectionViewDataSource {


    private lazy var collectionView: UICollectionView = {
        var flowLayout = UICollectionViewFlowLayout.init()
        let width = adaptWidth(60), height = adaptWidth(30)
        flowLayout.itemSize = CGSize.init(width: width, height: height)
        let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout:flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .yellow
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "HomeCell")
        self.addSubview(collectionView)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.collectionView.isHidden = false
        
    }
    
    //MARK: - --- delegate，dataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath)
        cell.backgroundColor = .red
        cell.layer.cornerRadius = 8
        cell.layer.masksToBounds = true
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1

        var label: UILabel!
        
        if let lab: UILabel = cell.contentView.subviews.last as? UILabel{
            label = lab
        }else{
            label = UILabel.init()
            cell.contentView.addSubview(label)
            label.textColor = .white
            label.snp.makeConstraints { (make) in
                make.center.equalTo(cell.contentView.center)
            }
        }
        
        label.text = "\(indexPath.row)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        
    }


    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
