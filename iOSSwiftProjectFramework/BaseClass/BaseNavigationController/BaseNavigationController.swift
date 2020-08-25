//
//  BaseNavigationController.swift
//  iOSSwiftProjectFramework
//
//  Created by GG266 on 2020/8/6.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = MAIN_COLOR
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: BOLD_FONT_SIZE_20]
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.children.count == 1 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
        
        if let tabBarController = self.tabBarController  {
            var frame = tabBarController.tabBar.frame
            frame.origin.y = SCREEN_HEIGHT - frame.size.height
            tabBarController.tabBar.frame = frame
        }
    }
    
}
