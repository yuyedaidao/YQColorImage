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
        return  image.resizableImage(withCapInsets: UIEdgeInsets(top: border + radius, left: border + radius, bottom: border + radius, right: border + radius))
    }
    /// 方形图片
    ///
    /// - Parameters:
    ///   - size: 图片大小
    ///   - radius: 圆角大小
    /// - Returns: Image
    open func rectangleImage(width size: CGSize, radius: CGFloat = 0, shadowOffset: CGSize = .zero, shadowBlur: CGFloat = 3, shadowColor: UIColor? = nil) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else {
            return UIImage()
        }
        setFill()
        var rect = CGRect(origin: CGPoint.zero, size: size)
        var edgeInsets = UIEdgeInsets.zero
        if let shadowColor = shadowColor {
            let blur = shadowBlur
            if shadowOffset.width < 0 {
                edgeInsets.left = abs(shadowOffset.width) + blur
                let right = shadowOffset.width + blur
                edgeInsets.right = right > 0 ? right : 0
            } else {
                let left = blur - shadowOffset.width
                edgeInsets.left = left > 0 ? left : 0
                edgeInsets.right = shadowOffset.width + blur
            }
            
            if shadowOffset.height < 0 {
                edgeInsets.top = abs(shadowOffset.height) + blur
                let bottom = shadowOffset.height + blur
                edgeInsets.bottom = bottom > 0 ? bottom : 0
            } else {
                let top = blur - shadowOffset.height
                edgeInsets.top = top > 0 ? top : 0
                edgeInsets.bottom = shadowOffset.height + blur
            }
            rect = rect.inset(by: edgeInsets)
            context.setShadow(offset: shadowOffset, blur: shadowBlur, color: shadowColor.cgColor)
        }
        if radius == 0 {
            context.fill(rect)
        } else {
            let path = UIBezierPath(roundedRect: rect, cornerRadius: radius)
            context.addPath(path.cgPath)
            context.fillPath()
        }
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
            return UIImage()
        }
        UIGraphicsEndImageContext()
        let capInsets = UIEdgeInsets(top: size.height / 2 - 2, left: size.width / 2 - 2, bottom: size.height / 2 - 2, right: size.width / 2 - 2)
        return image.resizableImage(withCapInsets: capInsets)
    }
}

