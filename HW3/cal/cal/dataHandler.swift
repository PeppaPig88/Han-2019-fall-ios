//
//  dataHandler.swift
//  cal
//
//  Created by Songming Han on 9/17/19.
//  Copyright © 2019 Songming Han. All rights reserved.
//

import Foundation
import UIKit

class dataHandler: NSObject {
    let funcArray: CharacterSet = ["+", "-", "*", "/"];
    func calculateEquation(equation:String) -> Double {
        let elementArray = equation.components(separatedBy: funcArray);
        var index = 0;
        var result:Double = Double(elementArray[0])!
        for char in equation {
            switch char {
            case "+":
                index += 1;
                if elementArray.count>index {
                    result += Double(elementArray[index])!
                }
            case "-":
                index += 1
                if elementArray.count>index {
                    result -= Double(elementArray[index])!
                }
            case "*":
                index += 1
                if elementArray.count>index {
                    result *= Double(elementArray[index])!
                }
            case "/":
                index += 1
                if elementArray.count>index {
                    result /= Double(elementArray[index])!
                }


            default:
                return result;
            }
        }
        return result;
    }
    
}
