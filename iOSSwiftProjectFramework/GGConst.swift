//
//  GGConst.swift
//  iOSSwiftProjectFramework
//
//  Created by GG266 on 2020/8/6.
//

import UIKit
import Foundation

/** 统一管理常量 */

// 服务器地址
let API_URL = ""

///当前设备是否是iPhoneX
let isPhoneX = (SCREEN_HEIGHT == 375.0 || SCREEN_HEIGHT == 812.0)

// 尺寸宏
let STATUSBAR_HEIGHT: CGFloat = 20.0
let NAVIGATIONBAR_HEIGHT: CGFloat = (isPhoneX ? 44.0 : 20.0)
let NavigationBarIconSize: CGFloat = 40.0
let TABBAR_HEIGHT: CGFloat = (isPhoneX ? (49.0 + 34.0) : 49.0)
let TabBarIcon: CGFloat = 30.0
let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT: CGFloat =  UIScreen.main.bounds.size.height
let Bottom_SafeArea_HEIGHT: CGFloat = (isPhoneX ? 34.0 : 0.0)

// deinit 内部宏
func deinitPrint( c: Any) {
    print("\(c.self)--deinit")
}

// 打印宏
//替换print来使用，debug模式下可以打印很多方法名，行信息。
#if DEBUG
func DPrint(_ items: Any...) {
    print(items)
}
#else
func DPrint(_ items: Any...) {

}
#endif

// 自适应设备宽度
func adaptWidth(_ w: CGFloat)->CGFloat{ return (SCREEN_WIDTH / 375.0 * w)}
// 自适应设备高度
func adaptHeight(_ h: CGFloat)->CGFloat{ return (SCREEN_HEIGHT / 667.0 * h)}



// 字体大小自适应
func systemFont(_ fontSize: CGFloat)->UIFont{ return UIFont.systemFont(ofSize: fontSize) }
func boldSystemFont(_ fontSize: CGFloat)->UIFont{  return UIFont.boldSystemFont(ofSize: fontSize) }
func adaptFont(_ fontSize: CGFloat)->CGFloat{ return ((SCREEN_WIDTH / 375.0 * (fontSize) < 12.0 && fontSize >= 12.0) ? 12.0 : SCREEN_WIDTH / 375.0 * (fontSize))}

// 常用字体
let FONT_SIZE_18 = systemFont(adaptFont(18))
let FONT_SIZE_17 = systemFont(adaptFont(17))
let FONT_SIZE_16 = systemFont(adaptFont(16))
let FONT_SIZE_15 = systemFont(adaptFont(15))
let FONT_SIZE_14 = systemFont(adaptFont(14))
let FONT_SIZE_13 = systemFont(adaptFont(13))
let FONT_SIZE_12 = systemFont(adaptFont(12))
let FONT_SIZE_10 = systemFont(adaptFont(10))

let BOLD_FONT_SIZE_32 = boldSystemFont(adaptFont(32))
let BOLD_FONT_SIZE_20 = boldSystemFont(adaptFont(20))
let BOLD_FONT_SIZE_18 = boldSystemFont(adaptFont(18))
let BOLD_FONT_SIZE_17 = boldSystemFont(adaptFont(17))
let BOLD_FONT_SIZE_16 = boldSystemFont(adaptFont(16))
let BOLD_FONT_SIZE_15 = boldSystemFont(adaptFont(15))
let BOLD_FONT_SIZE_14 = boldSystemFont(adaptFont(14))
let BOLD_FONT_SIZE_13 = boldSystemFont(adaptFont(13))
let BOLD_FONT_SIZE_12 = boldSystemFont(adaptFont(12))
let BOLD_FONT_SIZE_10 = boldSystemFont(adaptFont(10))


//屏幕window
let WINDOW: UIWindow? = UIApplication.shared.windows.first

// 系统宏
// 获取当前系统版本
let CurrentSystemVersion = UIDevice.current.systemVersion
// 获取当前语言
let CurrentLanguage: String? = NSLocale.preferredLanguages.first

// 版本判断
let IOS10_OR_LATER = (UIDevice.current.systemVersion.compare("10.0", options: String.CompareOptions.numeric, range: nil, locale: nil) != ComparisonResult.orderedAscending)
let IOS11_OR_LATER = (UIDevice.current.systemVersion.compare("11.0", options: String.CompareOptions.numeric, range: nil, locale: nil) != ComparisonResult.orderedAscending)
let IOS12_OR_LATER = (UIDevice.current.systemVersion.compare("12.0", options: String.CompareOptions.numeric, range: nil, locale: nil) != ComparisonResult.orderedAscending)
let IOS13_OR_LATER = (UIDevice.current.systemVersion.compare("13.0", options: String.CompareOptions.numeric, range: nil, locale: nil) != ComparisonResult.orderedAscending)


// 判断是真机还是模拟器
#if TARGET_OS_IPHONE
// iPhone Device
#endif
#if TARGET_IPHONE_SIMULATOR
// iPhone Simulator
#endif



// 图片宏
// 读取本地图片
func Image(_ imageName: String)->UIImage?{
    return UIImage.init(named: imageName)
}

func LoadLocalImage(_ filePath: String)->UIImage?{
    return UIImage.init(contentsOfFile: filePath)
}


// 颜色宏
// rgb颜色转换（16进制->10进制）
func HexColor(value: Int) -> UIColor { return UIColor.init(red: CGFloat((((value & 0xFF0000) >> 16)))/255.0, green: CGFloat((((value & 0xFF00) >> 8)))/255.0, blue: CGFloat(((value & 0xFF)))/255.0, alpha:1.0) }

// 带有RGBA的颜色设置
func RGB(_ R: CGFloat,_ G: CGFloat,_ B: CGFloat) -> UIColor {
    UIColor.init(red: R/255.0, green:G/255.0, blue:B/255.0, alpha:1.0)
}
func RGBA(_ R: CGFloat,_ G: CGFloat,_ B: CGFloat,_ A: CGFloat) -> UIColor {
    UIColor.init(red: R/255.0, green:G/255.0, blue:B/255.0, alpha:A)
}


// 背景色
let BACKGROUND_COLOR = RGB(247.0, 247.0, 247.0)

let MAIN_COLOR = RGB(255.0, 0.0, 30.0)

// 常用颜色
let CLEARCOLOR = UIColor.clear
let WHITE_COLOR = UIColor.white
let BLACK_COLOR = UIColor.black
//随机色
let RANDOM_COLOR = UIColor.init(red: CGFloat(arc4random_uniform(255))/255.0, green: CGFloat(arc4random_uniform(255))/255.0, blue: CGFloat(arc4random_uniform(255))/255.0, alpha: 1.0)


// 线条颜色
let LINE_COLOR = RGB(221.0, 221.0, 221.0)

// NSUserDefaults 实例化
let USER_DEFAULT = UserDefaults.standard

// 默认缓存路径
let CACHES_PATH = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]


