//
//  ViewController.swift
//  YQColorImage
//
//  Created by wyqpadding@gmail.com on 03/15/2019.
//  Copyright (c) 2019 wyqpadding@gmail.com. All rights reserved.
//

import UIKit
import YQColorImage

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image =  UIColor.red.circleImage(with: 12)
        let imgView = UIImageView(image: image)
        imgView.sizeToFit()
        self.view.addSubview(imgView)
        
        let circle = UIColor.blue.transparentCircleImage(with: 30)
        let imgView1 = UIImageView(image: circle)
        imgView1.sizeToFit()
        self.view.addSubview(imgView1)
        
        let rectangle = UIColor.green.transparentRectangleImage(with: CGSize(width: 100, height: 60),border: 6, radius: 8)
        let imgView2 = UIImageView(image: rectangle)
        imgView2.sizeToFit()
        self.view.addSubview(imgView2)
        imgView2.center = self.view.center
        
        let rectangle2 = UIColor.orange.rectangleImage(width: CGSize(width: 200, height: 130), radius: 10, shadowOffset: CGSize(width: -10, height: -10), shadowBlur: 35, shadowColor: UIColor.blue)
        let imgView3 = UIImageView(image: rectangle2)
//        imgView3.layer.borderColor = UIColor.black.cgColor
//        imgView3.layer.borderWidth = 1
//        imgView3.sizeToFit()
        self.view.addSubview(imgView3)
        imgView3.center = self.view.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

