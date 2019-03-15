//
//  Color+Image.swift
//  YQColorImage_Example
//
//  Created by 王叶庆 on 2019/3/15.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// 圆形图片
    ///
    /// - Parameter radius: 半径
    /// - Returns: Image
    func circleImage(with radius: CGFloat) -> UIImage {
        let width = radius * 2
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: width), false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        setFill()
        context?.fillEllipse(in: CGRect(x: 0, y: 0, width: width
            , height: width))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    /// 中间透明的图片，透明部分是圆形
    ///
    /// - Parameters:
    ///   - radius: 圆形半径
    ///   - border: 圆形到边的宽度
    /// - Returns: image
    func transparentCircleImage(with radius:CGFloat, border: CGFloat = 2) -> UIImage {
      
        let width = radius * 2
        let size =  CGSize(width: width + 2 * border, height: width + 2 * border)
        let rect = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        setFill()
        context?.fill(rect)
        let circleRect = CGRect(x: border, y: border, width: width, height: width)
        context?.addEllipse(in: circleRect)
        context?.clip()
        context?.clear(circleRect)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    /// 方形图片
    ///
    /// - Parameters:
    ///   - size: 图片大小
    ///   - radius: 圆角大小
    /// - Returns: Image
    func roundImage(width size: CGSize, radius: CGFloat = 0) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        setFill()
        let rect = CGRect(origin: CGPoint.zero, size: size)
        if radius == 0 {
            context?.fill(rect)
        } else {
            let path = UIBezierPath(roundedRect: rect, cornerRadius: radius)
            context?.addPath(path.cgPath)
            context?.fillPath()
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image.resizableImage(withCapInsets: UIEdgeInsets(top: radius, left: radius, bottom: radius, right: radius))
    }
}

