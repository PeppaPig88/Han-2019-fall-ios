//
//  addClassViewController.swift
//  ClassCalender
//
//  Created by Songming Han on 2019/12/4.
//  Copyright © 2019 Songming Han. All rights reserved.
//
import UIKit


typealias blc = (_ str1:String, _ str2:String,_ str3:String)->Void
class addClassViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource {
    let mainTable : UITableView = UITableView(frame: UIScreen.main.bounds, style: UITableView.Style.plain)
    var picker : UIView = UIView()
    var pickerView : UIPickerView = UIPickerView()
    var clickedCell = IndexPath()
    var blo : blc!
    
    let name_links_array : [String] =
        [
            "Class Name","How Many Classes","Week Day"
        ]
    
    let start_week_array : [String] =
        [
            "Mon","Tue","Wed","Thu","Fir","Sat","Sun"
        ]
    
    let class_count_array : [String] =
        [
            "1","2","3","4","5"
        ]
   
    
    public var detail_array : [String] =
        [
            "","",""
        ]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //Return rows
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if clickedCell.row == 1 {
            return class_count_array.count
        }else{
            return start_week_array.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //赋值
        if clickedCell.row == 1 {
            return class_count_array[row]
        }else {
            return start_week_array[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if 0 == component {
            
        }else {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name_links_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: nil)
        let title :String = name_links_array[indexPath.row]
        cell.textLabel!.text = title
        cell.detailTextLabel?.text = detail_array[indexPath.row]
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator;
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let sb = UIStoryboard.init(name: "Main", bundle:Bundle.main)
            let chooseClassVC : choseClassVC = sb.instantiateViewController(withIdentifier: "choseClassVC") as! choseClassVC
//            chooseClassVC.delegate = self
            chooseClassVC.myBlock = {a in
                self.detail_array[0] = a
            }
            self.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(chooseClassVC, animated: true)
            self.hidesBottomBarWhenPushed = true
        }
        if indexPath.row > 0 {
            picker.isHidden = false
        }
        clickedCell = indexPath
        pickerView.reloadAllComponents()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    @objc func clickCancelBtn() {
        picker.isHidden = true
    }
    @objc func clickDoneBtn() {
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        var string = String()
        if clickedCell.row == 1 {
            string = class_count_array[selectedRow]
        }else {
            string = start_week_array[selectedRow]
        }
        let cell = mainTable.cellForRow(at: clickedCell)
        cell?.detailTextLabel?.text = string
        detail_array[clickedCell.row] = string
        let array : [IndexPath] = [clickedCell]
        mainTable.reloadRows(at: array, with: UITableView.RowAnimation.automatic)
        picker.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let path = IndexPath(row: 0, section: 0)
        let array : [IndexPath] = [path]
        mainTable.reloadRows(at: array, with: UITableView.RowAnimation.automatic)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Add Class"
        self.view.addSubview(mainTable)
        mainTable.delegate = self
        mainTable.dataSource = self
        creatTableHead()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        clickedCell = IndexPath(row: 0, section: 0)
        picker = UIView(frame: CGRect(x: 0, y: SCREEN_HEIGHT*0.7, width: SCREEN_WIDTH, height: SCREEN_HEIGHT*0.3))
        self.view.addSubview(picker)
        pickerView = UIPickerView(frame: CGRect(x: 0, y: SCREEN_HEIGHT*0.05, width: SCREEN_WIDTH, height: SCREEN_HEIGHT*0.25))
        picker.addSubview(pickerView)
        let pickerToolBar = UIToolbar(frame:CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT*0.05))
        let barItems = NSMutableArray()
        let cancelBtn = UIBarButtonItem.init(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(addClassViewController.clickCancelBtn))
        barItems.add(cancelBtn)
        let btnSpace = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        barItems.add(btnSpace)
        let doneBtn = UIBarButtonItem.init(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(addClassViewController.clickDoneBtn))
        barItems.add(doneBtn)
        pickerToolBar.setItems((barItems as! [UIBarButtonItem]), animated: true)
        picker.addSubview(pickerToolBar)
        pickerView.delegate = self
        pickerView.dataSource = self
        picker.isHidden = true
    }
    func creatTableHead() {
        let headView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT*0.2))
        headView.backgroundColor = UIColor.init(displayP3Red: 188.0/255.0, green: 202.0/255.0, blue: 170.0/255.0, alpha: 0.8)
        let addClass = addClassBtn()
        let width = headView.bounds.size.width
        let height = headView.bounds.size.height
        addClass.tag = 1
        addClass.addTarget(self, action: #selector(addClassViewController.clickShareClass(_:)), for: UIControl.Event.touchUpInside)
        addClass.frame = CGRect(x: width*0.1, y: height*0.1, width: width*0.167, height: height*0.8)
        addClass.createMyBtn(UIImage.init(named: "添加设备")!, andTitle: "Add Class")
        headView.addSubview(addClass)
        let plusClass = addClassBtn()
        plusClass.addTarget(self, action: #selector(addClassViewController.clickShareClass(_:)), for: UIControl.Event.touchUpInside)
        plusClass.frame = CGRect(x: width*0.43, y: height*0.1, width: width*0.167, height: height*0.8)
        headView.addSubview(plusClass)
        let shareClass = addClassBtn()
        shareClass.addTarget(self, action: #selector(addClassViewController.clickShareClass(_:)), for: UIControl.Event.touchUpInside)
        shareClass.frame = CGRect(x: width*0.75, y: height*0.1, width: width*0.167, height: height*0.8)
        headView.addSubview(shareClass)
        mainTable.tableHeaderView = headView
        let view = UIView()
        view.backgroundColor = UIColor.clear
        mainTable.tableFooterView = view
    }
    @objc func clickShareClass(_ sender:UIButton){

            self.blo(detail_array[0],detail_array[1],detail_array[2])
            self.navigationController?.popViewController(animated: true)
        
        
        
    }
    
    
//    func backStr(str: String) {
//        detail_array[0] = str
//    }
    
    func initTableView() {
        
    }
   
    

}
