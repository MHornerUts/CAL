import Foundation

class Calculator {
    
    var currentResult = 0;
    
    func add(no1: Int, no2: Int) -> Int {
        return no1 + no2;
    }
    
    func sub(no1: Int, no2: Int) -> Int {
        return no1 - no2;
    }
    
    func mul(no1: Int, no2: Int) -> Int {
        return no1 * no2;
    }
    
    func div(no1: Int, no2: Int) -> Int {
        return no1 / no2;
    }
    
    func rem(no1: Int, no2: Int) -> Int {
        return no1 % no2;
    }
    
    func prio(symbol: String) -> Int {
        var p: Int = 0
        switch symbol {
        case "x":
            p = 1
        case "/":
            p = 1
        case "%":
            p = 1
        default:
            p = 0
        }
        return p
    }
    
    func order(args: [String]) -> Int {
        var counter: Int = 0
        var result: Int = 0
        
        for symbol in args {
            if (symbol == "+" || symbol == "-" || symbol == "/" || symbol == "x" || symbol == "%") {
                if (counter > 1) {
                    if (prio(symbol: args[counter]) > prio(symbol: args[result])) {
                        result = counter
                    }
                }
                else {
                    result = counter
                }
            }
            counter += 1
        }
        return result;
    }
    
    func updateNumbers(args: [String], start: Int, result: Int) -> [String] {
        var newNumbers: [String] = args
        newNumbers[start] = String(result)
        newNumbers.remove(at: start-1)
        newNumbers.remove(at: start)
        
       
        
        return newNumbers
        
    }
    
    func calculate(args: [String]) -> String {
        
        
        var result: Int = 0
        
        let start = order(args: args)
        
        if (args.count == 1) {
            return String(Int(args[0])!)
        }
        
        //print(args.joined(separator: " "))
        
        switch args[start] {
        case "+":
            result = add(no1: Int(args[start - 1])!, no2: Int(args[start + 1])!);
        case "x":
            result = mul(no1: Int(args[start - 1])!, no2: Int(args[start + 1])!);
        case "/":
            result = div(no1: Int(args[start - 1])!, no2: Int(args[start + 1])!);
        case "%":
            result = rem(no1: Int(args[start - 1])!, no2: Int(args[start + 1])!);
        default:
            result = sub(no1: Int(args[start - 1])!, no2: Int(args[start + 1])!);
        }
        
        let newArgs = updateNumbers(args: args, start: start, result: result)
        
        currentResult = result
        
        if (newArgs.count > 1) {
            return calculate(args: newArgs)
        }
        
        return(String(currentResult))
    }
}
