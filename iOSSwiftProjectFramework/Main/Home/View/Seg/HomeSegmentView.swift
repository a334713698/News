//
//  HomeSegmentView.swift
//  iOSSwiftProjectFramework
//
//  Created by fcn on 2020/8/24.
//  Copyright © 2020 hdj. All rights reserved.
//

import UIKit

let HomeSegmentViewHeight: CGFloat = adaptWidth(45)


class HomeSegmentView: BaseView, UICollectionViewDataSource, UICollectionViewDelegate {
    
//    var dataSource = [String]()
    var dataSource = ["科技", "教育", "文化", "经济", "政治", "体育", "科技", "教育", "文化", "经济", "政治", "体育"]
    var selectIndex = 0
    
    private lazy var collectionView: UICollectionView = {
        var flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize.init(width: HomeSegmentViewHeight, height: HomeSegmentViewHeight)
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = .horizontal;

        let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false;
        collectionView.showsHorizontalScrollIndicator = false;
        collectionView.register(DJCollectionViewCell.self, forCellWithReuseIdentifier: "DJCollectionViewCell")
        self.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(0)
            make.right.equalTo(-(HomeSegmentViewHeight + 1))
        }
        return collectionView
    }()
    
    private lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = .black
        self.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.width.equalTo(1)
            make.right.equalTo(-(HomeSegmentViewHeight))
        }
        return line
    }()
    
    private lazy var moreButton: UIButton = {
        let btn = UIButton()
        btn.setImage(Image("icon_more"), for: UIControl.State.normal)
        self.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.top.right.bottom.equalTo(0)
            make.width.equalTo(HomeSegmentViewHeight)
        }
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
        self.backgroundColor = RGB(232.0, 238.0, 241.0)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI(){
        self.moreButton.isHidden = false
        self.line.isHidden = false
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }

    // MARK -- UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DJCollectionViewCell", for: indexPath) as! DJCollectionViewCell
        cell.line.isHidden = !(self.selectIndex == indexPath.item)
        cell.titleLab.text = self.dataSource[indexPath.item]
        return cell
    }
    
    // MARK -- UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectIndex = indexPath.item
        self.collectionView.reloadData()
        self.collectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
    }
}

class DJCollectionViewCell: UICollectionViewCell {
    
    lazy var titleLab: UILabel = {
        let titleLab = UILabel()
        self.contentView.addSubview(titleLab)
        titleLab.snp.makeConstraints { (make) in
            make.center.equalTo(titleLab.superview!.center)
        }
        return titleLab
    }()
    
    lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = MAIN_COLOR
        self.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.height.equalTo(2)
            make.centerX.equalTo(line.superview!.snp_centerXWithinMargins)
            make.width.equalTo(frame.size.width / 3)
        }
        return line
    }()

    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
