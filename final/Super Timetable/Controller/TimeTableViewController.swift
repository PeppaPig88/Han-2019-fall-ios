//
//  TimeTableViewController.swift
//  ClassCalender
//
//  Created by Songming Han on 2019/12/4.
//  Copyright © 2019 Songming Han. All rights reserved.
//
import UIKit
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
/*
 calender table view
 **/
class TimeTableViewController: UIViewController {

    var result_array:[String] =
        [
            "","",""
        ]
    
    override func viewWillAppear(_ animated: Bool) {
        print(result_array)
        addToClassTable(result_array[0], weekMatch(result_array[2]), countMatch(result_array[1]))
        result_array =
        [
        "","",""
        ]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Second week"


        self.navigationController?.navigationBar.prefersLargeTitles = true
        setNavItem()
        initHeaderView()
    }
    
    func setNavItem() {
        let leftItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(TimeTableViewController.leftButtonClicked))
        self.navigationItem.rightBarButtonItem = leftItem
    }
    //add button
    @objc func leftButtonClicked(){
        let sb = UIStoryboard.init(name: "Main", bundle:Bundle.main)
        let addViewControll = sb.instantiateViewController(withIdentifier: "addVC") as! addClassViewController
        addViewControll.blo = {a,b,c in
            self.result_array[0] = a
            self.result_array[1] = b
            self.result_array[2] = c
        }
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(addViewControll, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    //Date View on the head
    func initHeaderView() {
        let date = NSDate()
        let timeFormatterMonth = DateFormatter()
        timeFormatterMonth.dateFormat = "MM"
        let strNowMonth = timeFormatterMonth.string(from: date as Date) as String
        let month = strNowMonth + "\n" + "month"
        let timeFormatterDay = DateFormatter()
        timeFormatterDay.dateFormat = "dd"
        let strNowDay = timeFormatterDay.string(from: date as Date) as String
        let day0 = Int(strNowDay)! - 3
        let day1 = Int(strNowDay)! - 2
        let day2 = Int(strNowDay)! - 1
        let day3 = Int(strNowDay)! - 0
        let day4 = Int(strNowDay)! + 1
        let day5 = Int(strNowDay)! + 2
        let day6 = Int(strNowDay)! + 3
        let str0 = "\n\(day0)"
        let str1 = "\n\(day1)"
        let str2 = "\n\(day2)"
        let str3 = "\n\(day3)"
        let str4 = "\n\(day4)"
        let str5 = "\n\(day5)"
        let str6 = "\n\(day6)"
        let weekArr : [String] = [month,"Mon"+str0,"Tue"+str1,"Wed"+str2,"Thu"+str3,"Fir"+str4,"Sat"+str5,"Sun"+str6]
        var nowIndex : CGFloat = 1.0
        let width : CGFloat = SCREEN_WIDTH/8.0
        for item in 0...7 {
            let headLabel : UILabel = UILabel(frame: CGRect(x: nowIndex, y: 116, width: width, height: SCREEN_HEIGHT*0.08))
            headLabel.adjustsFontSizeToFitWidth = true
            headLabel.numberOfLines = 0
            headLabel.textAlignment = NSTextAlignment.center
            headLabel.text = weekArr[item]
            headLabel.textColor = UIColor.black
            headLabel.backgroundColor = UIColor.init(red: 244.0/255.0, green: 244.0/255.0, blue: 244.0/255.0, alpha: 0.3)
            self.view.addSubview(headLabel)
            nowIndex += width
        }
    }
    //Add class to calender
    func addToClassTable(_ name:String ,_ weekDay:Int ,_ count:Int) -> Void {
        let cView = classView()
        cView.backgroundColor = UIColor.init(displayP3Red: 188.0/255.0, green: 202.0/255.0, blue: 170.0/255.0, alpha: 0.8)
        cView.frame = CGRect(x: CGFloat(Float(weekDay)*Float(SCREEN_WIDTH)/8.0),
                             y: SCREEN_HEIGHT*0.06+116,
                             width: SCREEN_WIDTH/6.0,
                             height: CGFloat(Float(count)*Float(SCREEN_HEIGHT)/10.0)
                            )
        cView.addClassView(name)
        self.view.addSubview(cView)
    }
    //How many class you have
    func countMatch(_ str:String) -> Int {
        switch str {
        case "1":
            return 1;
        case "2":
            return 2;
        case "3":
            return 3;
        case "4":
            return 4;
        case "5":
            return 5;
        default:
            return 0;
        }
    }

    func weekMatch(_ str:String) -> Int {
        switch str {
        case "Mon":
            return 1;
        case "Tue":
            return 2;
        case "Wed":
            return 3;
        case "Thu":
            return 4;
        case "Fir":
            return 5;
        case "Sat":
            return 6;
        case "Sun":
            return 7;
        default:
            return 0;
        }
    }
    
    
}
