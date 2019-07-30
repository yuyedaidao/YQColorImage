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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

