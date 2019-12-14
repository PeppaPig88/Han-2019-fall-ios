//
//  classView.swift
//  ClassCalender
//
//  Created by Songming Han on 2019/12/4.
//  Copyright © 2019 Songming Han. All rights reserved.
//

import UIKit

class classView: UIView {
    public func addClassView(_ name:String){
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        label.font = UIFont.systemFont(ofSize: 15.0)
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white
        label.text = name
        label.numberOfLines = 0
        self.addSubview(label)
    }
}
