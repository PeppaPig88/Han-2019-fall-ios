//
//  ViewController.swift
//  calculator
//
//  Created by Songming Han on 9/10/19.
//  Copyright © 2019 Songming Han. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var intcount = 0;
    @IBOutlet weak var resultLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func number1(_ sender: Any) {
        _ = 1;
        resultLable.text = String(1);
        intcount = intcount + 1;
    }
    
    @IBAction func number99(_ sender: Any) {
        resultLable.text = String(2)
        intcount = intcount + 2;
    }
    
    @IBAction func plusButton(_ sender: Any) {
        resultLable.text = String(intcount)
    }
}

