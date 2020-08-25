//
//  UIButton+ImageTitleSpacing.swift
//  iOSSwiftProjectFramework
//
//  Created by GG266 on 2020/8/7.
//

import Foundation
import UIKit

enum GGButtonEdgeInsetsStyle: Int {
    case Top // image在上，label在下
    case Left // image在左，label在右
    case Bottom // image在下，label在上
    case Right // image在右，label在左
}

extension UIButton{
    func layoutButton(edgeInsetsStyle style: GGButtonEdgeInsetsStyle, imageTitleSpace space: CGFloat) {
        // 1. 得到imageView和titleLabel的宽、高
        let imageWith = self.imageView?.frame.size.width;
        let imageHeight = self.imageView?.frame.size.height;
        
        
        var labelWidth: CGFloat = 0.0;
        var labelHeight: CGFloat = 0.0;
        if (Double(CurrentSystemVersion)! >= 8.0) {
            // 由于iOS8中titleLabel的size为0，用下面的这种设置
            labelWidth = CGFloat(self.titleLabel!.intrinsicContentSize.width);
            labelHeight = CGFloat(self.titleLabel!.intrinsicContentSize.height);
        } else {
            labelWidth = CGFloat((self.titleLabel?.frame.size.width)!);
            labelHeight = CGFloat((self.titleLabel?.frame.size.height)!);
        }
        
        // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
        var imageEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets = UIEdgeInsets.zero
        

        // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        switch (style) {
            case GGButtonEdgeInsetsStyle.Top:
                imageEdgeInsets = UIEdgeInsets.init(top: -labelHeight-space/2.0, left: 0, bottom: 0, right: -labelWidth)
                labelEdgeInsets = UIEdgeInsets.init(top:0, left:-imageWith!, bottom:-imageHeight!-space/2.0, right:0)
                
            case GGButtonEdgeInsetsStyle.Left:
                imageEdgeInsets = UIEdgeInsets.init(top:0, left:space/2.0, bottom:0, right:-space/2.0)
                labelEdgeInsets = UIEdgeInsets.init(top:0, left:-space/2.0, bottom:0, right:space/2.0)

            case GGButtonEdgeInsetsStyle.Bottom:
                imageEdgeInsets = UIEdgeInsets.init(top:0, left:0, bottom:-labelHeight-space/2.0, right:-labelWidth)
                labelEdgeInsets = UIEdgeInsets.init(top:-imageHeight!-space/2.0, left:-imageWith!, bottom:0, right:0)

            case GGButtonEdgeInsetsStyle.Right:
                    imageEdgeInsets = UIEdgeInsets.init(top:0, left:labelWidth+space/2.0, bottom:0, right:-labelWidth-space/2.0)
                    labelEdgeInsets = UIEdgeInsets.init(top:0, left:-imageWith!-space/2.0, bottom:0, right:imageWith!+space/2.0)
        }
        
        // 4. 赋值
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets

    }
}
