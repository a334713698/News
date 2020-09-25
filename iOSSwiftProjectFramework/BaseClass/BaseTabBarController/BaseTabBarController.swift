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
        let vcNames =  ["DJHomeViewController","DJHotViewController","DJMediaViewController","DJMeViewController"]
        let imageNames = ["icon_tab_home","icon_tab_hot","icon_tab_live","icon_tab_me"]
        let titles = ["首页","热门","直播","我的"]

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
            
            let image = Image(imageNames[i])?.dj_image(UIColor.gray)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            let selectedImage = Image(imageNames[i])?.dj_image(MAIN_COLOR)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
            
            nav.tabBarItem = UITabBarItem(
                title: nil,
                image: image,
                selectedImage: selectedImage
            )
            nav.tabBarItem.imageInsets = UIEdgeInsets.init(top: 5, left: 0, bottom: 0, right: 0)
            baseNavs.append(nav)
        }
        self.setViewControllers(baseNavs, animated: true)
    }
    
}
