//
//  UILabel+Feature.swift
//  iOSSwiftProjectFramework
//
//  Created by fcn on 2020/9/21.
//  Copyright © 2020 hdj. All rights reserved.
//

import Foundation
import UIKit


extension UILabel{
    
    func addShadowText(_ cont: String) {
        let attr = NSMutableAttributedString.init(string: cont)
        let shadow = NSShadow.init()
        shadow.shadowBlurRadius = 1.0
        shadow.shadowOffset = CGSize.init(width: 1.0, height: 1.0)
        shadow.shadowColor = UIColor.black
        attr.addAttribute(NSAttributedString.Key.shadow, value: shadow, range: NSRange.init(location: 0, length: cont.count))
        self.attributedText = attr
    }
}
