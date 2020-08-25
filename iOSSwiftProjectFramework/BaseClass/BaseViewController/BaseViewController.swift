//
//  BaseViewController.swift
//  iOSSwiftProjectFramework
//
//  Created by GG266 on 2020/8/6.
//

import UIKit

class BaseViewController: UIViewController {

    lazy var navButtonLeft: UIButton = {
        var btn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: NavigationBarIconSize, height: NavigationBarIconSize))
        btn.setImage(Image("arrow_left"), for: UIControl.State.normal)
        btn.center = CGPoint.init(x: btn.center.x, y: NAVIGATIONBAR_HEIGHT / 2.0)
        btn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        btn.addTarget(self, action: #selector(navLeftPressed), for: UIControl.Event.touchUpInside)
        self.navigationItem.setLeftBarButton(UIBarButtonItem.init(customView: btn), animated: true)
        return btn
    }()
    
    lazy var navButtonRight: UIButton = {
        var btn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: NavigationBarIconSize, height: NavigationBarIconSize))
        btn.setImage(Image("arrow_left"), for: UIControl.State.normal)
        btn.center = CGPoint.init(x: btn.center.x, y: NAVIGATIONBAR_HEIGHT / 2.0)
        btn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
        btn.addTarget(self, action: #selector(navRightPressed), for: UIControl.Event.touchUpInside)
        self.navigationItem.setRightBarButton(UIBarButtonItem.init(customView: btn), animated: true)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = WHITE_COLOR
        
        navButtonLeft.isHidden = false
    }
    
    @objc func navLeftPressed() {
        print("导航栏-左按钮点击")
        if self.presentingViewController == nil{
            self.navigationController?.popViewController(animated: true)
        }else{
            self .dismiss(animated: true, completion: nil)
        }
    }

    @objc func navRightPressed() {
        print("导航栏-右按钮点击")
    }

}
