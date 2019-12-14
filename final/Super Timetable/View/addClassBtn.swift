//
//  addClassBtn.swift
//  ClassCalender
//
//  Created by Songming Han on 2019/12/4.
//  Copyright © 2019 Songming Han. All rights reserved.
//
import UIKit

//button of add calss
class addClassBtn: UIButton {
    public var image = UIImage()
    public var title = String()
    func createMyBtn(_ image:UIImage, andTitle title:String) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: self.bounds.size.height*0.1, width: self.bounds.size.width, height: self.bounds.size.width))
        imageView.image = image
        let titleLabel = UILabel(frame: CGRect(x: 0, y: self.bounds.size.height*0.7, width:self.bounds.size.width, height: self.bounds.size.height*0.2))
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.text = title
        titleLabel.textColor = UIColor.black
        titleLabel.adjustsFontSizeToFitWidth = true
        self.addSubview(imageView)
        self.addSubview(titleLabel)
    }
}
