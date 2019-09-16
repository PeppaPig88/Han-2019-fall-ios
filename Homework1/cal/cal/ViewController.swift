//
//  ViewController.swift
//  cal
//
//  Created by Songming Han on 9/16/19.
//  Copyright © 2019 Songming Han. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLable: UILabel!
    var count = 0;
    var inputStore = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func number1(_ sender: Any) {
        resultLable.text = "1";
        inputStore = 1;
    }
    
    @IBAction func number2(_ sender: Any) {
        resultLable.text = "2";
        inputStore = 2;
    }
    @IBAction func plusBt(_ sender: Any) {
        count = count + inputStore;
        resultLable.text = String(count);
    }
    
    
    

}

