//
//  Validate.swift
//  calc
//
//  Created by Matthew Horner on 24/3/2022.
//  Copyright © 2022 UTS. All rights reserved.
//
// NONE OF THIS CODE WAS USED BECAUSE I REALISED THAT I HAVE THROW ERRORS TO PASS THE UNIT TESTS
import Foundation

class Validate {
    let validSymbols : [String] = ["x", "/", "+", "-", "%"]
    
    func symbolCheck(args : [String]) -> Bool {
        var counter = 0
        for symbol in args {
            if (counter > 0) {
                if (counter % 2 != 0) {
                    if (!validSymbols.contains(symbol)) {
                        return false
                    }
                }
            }
            counter += 1
        }
        return true
    }
    
    func numberCheck(args : [String]) -> Bool {
        var counter = 0
        var num : Int?
        let numCheck : Int? = nil
        for symbol in args {
            if (counter % 2 == 0) {
                num = Int(symbol) ?? nil
                if (num == numCheck) {
                    return false
                }
            }
            counter += 1
        }
        return true
    }
    
    func formatCheck(args : [String]) -> Bool {
        var flag = false
        for symbol in args {
            if (validSymbols.contains(symbol)) {
                flag =  true
            } else if (flag) {
                flag = false
            }
        }
        if (flag) {
            return false
        }
        return true
    }
    
    
    func validation( args : [String]) -> Bool {
        guard symbolCheck(args: args) else {
            return false
        }
        guard !args.isEmpty else {
            return false
        }
        guard numberCheck(args: args) else {
            return false
        }
        guard formatCheck(args: args) else {
            return false
        }
        return true
    }
}
