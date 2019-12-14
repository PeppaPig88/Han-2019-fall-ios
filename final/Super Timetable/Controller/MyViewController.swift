//
//  MyViewController.swift
//  ClassCalender
//
//  Created by Songming Han on 2019/12/4.
//  Copyright © 2019 Songming Han. All rights reserved.
//

import UIKit
class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    


    @IBAction func myBtn(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Alert",message: "In progress！", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Confirm", style: .default, handler: {
            action in
        })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func settingBtn(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Alert",message: "In progress！", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Confirm", style: .default, handler: {
            action in
        })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }

    
}
