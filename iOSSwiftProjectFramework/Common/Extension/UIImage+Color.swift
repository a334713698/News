//
//  UIImage+Color.swift
//  iOSSwiftProjectFramework
//
//  Created by fcn on 2020/9/25.
//  Copyright © 2020 hdj. All rights reserved.
//

import Foundation
import UIKit


extension UIImage{
    func dj_image(_ color: UIColor) -> UIImage? {
        return self.dj_image(color, CGSize.init(width: self.size.width, height: self.size.height))
    }
    
    func dj_image(_ color: UIColor, _ size: CGSize) -> UIImage? {
        if size.width <= 0 || size.height <= 0{
            return nil
        }
        let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, self.scale)
        if let context = UIGraphicsGetCurrentContext(){
            context.translateBy(x: 0, y: self.size.height)
            context.scaleBy(x: 1.0, y: -1.0)
            context.setBlendMode(.normal)

            context.clip(to: rect, mask: self.cgImage!)

            context.setFillColor(color.cgColor)
            context.fill(rect)

            let image = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            return image
        }else{
            return nil
        }
    }
}
