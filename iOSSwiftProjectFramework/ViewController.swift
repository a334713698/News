//
//  ViewController.swift
//  iOSSwiftProjectFramework
//
//  Created by GG266 on 2020/8/7.
//  Copyright © 2020 hdj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.perform(#selector(initTab), with: nil, afterDelay: 1)
    }
    
    @objc func initTab(){
        if let window = UIApplication.shared.windows.first {
            let tabbarController = BaseTabBarController()
            window.rootViewController = tabbarController;
            window.makeKeyAndVisible()
        }
    }
}

