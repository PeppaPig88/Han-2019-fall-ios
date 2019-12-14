//
//  TodoModel.swift
//  ClassCalender
//
//  Created by Songming Han on 2019/12/4.
//  Copyright © 2019 Songming Han. All rights reserved.
//
import UIKit

class TodoModel: NSObject {
    var id: String
    var image: String
    var title: String
    var date: NSDate
    
    init (id: String, image: String, title: String, date: NSDate) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
}
