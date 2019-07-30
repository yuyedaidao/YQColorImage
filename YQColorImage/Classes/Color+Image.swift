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
    open func circleImage(with radius: CGFloat) -> UIImage {
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
    open func transparentCircleImage(with radius:CGFloat, border: CGFloat = 2, antialias: Bool = true) -> UIImage {
      
        let width = radius * 2
        let size =  CGSize(width: width + 2 * border, height: width + 2 * border)
        let rect = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        //取消抗锯齿 。。。额，取消之后反而出来的图比较顺滑
        context?.setShouldAntialias(antialias)
        setFill()
        context?.fill(rect)
        let circleRect = CGRect(x: border, y: border, width: width, height: width)
        context?.addEllipse(in: circleRect)
        context?.clip()
        context?.clear(circleRect)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return  image
    }
    open func transparentRectangleImage(with size: CGSize, border: CGFloat = 2, radius: CGFloat = 0, antialias: Bool = true) -> UIImage {
        let newSize =  CGSize(width: size.width + 2 * border, height: size.height + 2 * border)
        let rect = CGRect(origin: CGPoint.zero, size: newSize)
        UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        //取消抗锯齿 。。。额，取消之后反而出来的图比较顺滑
        context?.setShouldAntialias(antialias)
        setFill()
        context?.fill(rect)
        let path = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: border, y: border), size: size), cornerRadius: radius)
        context?.addPath(path.cgPath)
        context?.clip()
        context?.clear(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return  image.resizableImage(withCapInsets: UIEdgeInsets(top: radius, left: radius, bottom: radius, right: radius))
    }
    /// 方形图片
    ///
    /// - Parameters:
    ///   - size: 图片大小
    ///   - radius: 圆角大小
    /// - Returns: Image
    open func rectangleImage(width size: CGSize, radius: CGFloat = 0) -> UIImage {
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

