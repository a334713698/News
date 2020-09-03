//
//  BaseTabBarController.swift
//  iOSSwiftProjectFramework
//
//  Created by GG266 on 2020/8/6.
//

import UIKit

let TAG_BTN = 0x0100

class BaseTabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.initSubviews()
        
    }
    
    func initSubviews() {
        let vcNames =  ["DJHomeViewController","OneViewController","DJMediaViewController","DJMeViewController"]
        let imageNames = ["","","",""]
        let imageNames_selected = ["","","",""]
        let titles = ["首页","2","视频","我的"]

        var baseNavs = Array<BaseNavigationController>()
        for (i, vcName) in vcNames.enumerated() {
            guard let spaceName = Bundle.main.infoDictionary!["CFBundleName"] as? String else {
                print("获取命名空间失败")
                return
            }
            
            let vcClass: AnyClass? = NSClassFromString(spaceName + "." + vcName)
            guard let cls = (vcClass as? BaseViewController.Type) else {
                 print("cls不能创建BaseViewController类")
                 return
             }
            let vc = cls.init()
            let nav = BaseNavigationController.init(rootViewController: vc)
            vc.title = titles[i]
            nav.tabBarItem = UITabBarItem(
                title: titles[i],
                image: Image(imageNames[i])?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal),
                selectedImage: Image(imageNames_selected[i])?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            )
            baseNavs.append(nav)
        }
        self.setViewControllers(baseNavs, animated: true)
    }
    
}
