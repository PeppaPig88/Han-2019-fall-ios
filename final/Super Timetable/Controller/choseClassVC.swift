//
//  choseClassVC.swift
//  ClassCalender
//
//  Created by Songming Han on 2019/12/4.
//  Copyright © 2019 Songming Han. All rights reserved.
//
import UIKit
protocol chooseDelegate {
    func backStr(str:String) -> Void
}
typealias block = (_ str:String)->Void
class choseClassVC: UIViewController {
    public var dataToA = ""
    @IBOutlet weak var txtClassName: UITextField!
    var myBlock : block!
    var delegate : chooseDelegate!
    @IBAction func btOK(_ sender: UIButton) {
        dataToA = txtClassName.text!
        self.myBlock(dataToA)
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Current Semester"
    }
    
    
   

}
