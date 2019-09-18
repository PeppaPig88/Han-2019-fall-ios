//
//  ViewController.swift
//  cal
//
//  Created by Songming Han on 9/16/19.
//  Copyright © 2019 Songming Han. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let calculator = dataHandler();
    @IBOutlet weak var resultLable: UILabel!
    var count = 0;
    var inputStore = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func number1(_ sender: Any) {
        inputStore = inputStore + "1";
        resultLable.text = inputStore;
        
    }
    
    @IBAction func number2(_ sender: Any) {
        inputStore = inputStore + "2";
        resultLable.text = inputStore;
    }
    @IBAction func plusBt(_ sender: Any) {
        inputStore = inputStore + "+";
        resultLable.text = inputStore;
    }
    
    @IBAction func equeBt(_ sender: Any) {
        inputStore = inputStore + "=";
        count = Int(calculator.calculateEquation(equation: inputStore));
        inputStore = inputStore + String(count);
        
    }
    
}



