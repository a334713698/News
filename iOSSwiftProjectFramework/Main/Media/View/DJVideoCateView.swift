//
//  DJVideoCateView.swift
//  iOSSwiftProjectFramework
//
//  Created by fcn on 2020/9/3.
//  Copyright © 2020 hdj. All rights reserved.
//

import UIKit

let CateItemHeight = adaptWidth(30)
let CateItemMargin: CGFloat = adaptWidth(8.0)

@objc protocol DJVideoCateViewDelegate: NSObjectProtocol {
    func itemDidSelected(_ index: Int)
    
}


class DJVideoCateView: BaseView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    weak var delegate: DJVideoCateViewDelegate?

    var cateArr: [String]?    

    var selectedIndex: Int = 0
    
    lazy var collectionView: UICollectionView = {
        var flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.minimumLineSpacing = CateItemMargin
        flowLayout.minimumInteritemSpacing = CateItemMargin
        flowLayout.sectionInset = UIEdgeInsets.init(top: CateItemMargin, left: CateItemMargin, bottom: CateItemMargin, right: CateItemMargin)
        let width = adaptWidth(60), height = CateItemHeight
        flowLayout.itemSize = CGSize.init(width: width, height: height)
        let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout:flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
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
        if let cates = self.cateArr {
            return cates.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath)
        cell.layer.cornerRadius = CateItemHeight/2.0
        cell.layer.masksToBounds = true
        cell.layer.borderWidth = 1

        var label: UILabel!
        
        if let lab: UILabel = cell.contentView.subviews.last as? UILabel{
            label = lab
        }else{
            label = UILabel.init()
            cell.contentView.addSubview(label)
            label.font = UIFont.systemFont(ofSize: 15)
            label.snp.makeConstraints { (make) in
                make.center.equalTo(cell.contentView.center)
            }
        }
        
        if self.selectedIndex == indexPath.row {
            cell.backgroundColor = .red
            cell.layer.borderColor = UIColor.red.cgColor
            label.textColor = .white
        }else{
            cell.backgroundColor = .white
            cell.layer.borderColor = UIColor.black.cgColor
            label.textColor = .black
        }
        
        label.text = "\(self.cateArr![indexPath.row])"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        self.collectionView.reloadData()
        if self.delegate != nil && self.delegate!.responds(to: #selector(delegate?.itemDidSelected(_:))){
            self.delegate?.itemDidSelected(indexPath.item)
        }
    }


    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
