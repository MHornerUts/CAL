//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

//print(args[0])
// Retrieve User Input
//let no1 = args[0]; // Sample Code Only! Update Required!
//let operatorTest = args[1]; // Sample Code Only! Update Required!
//let no2 = args[2]; // Sample Code Only! Update Required!
//let input = readLine()

// Initialize a Calculator object
let calculator = Calculator();

let validate = Validate();

// Calculate the result

//let fixedInput: [String] = input!.components(separatedBy: " ")

//let result = 10

//let test = validate.symbolCheck(args: args)

//print(test)
//if (validate.validation(args: args)) {
    
    let result = calculator.calculate(args: args)
    print(result)
    
//}
