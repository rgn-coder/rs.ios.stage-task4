import Foundation



public extension Int {
    var numbersDict:[Int:String] {
        return [
            1: "I",
            2: "II",
            3: "III",
            4: "IV",
            5: "V",
            6: "VI",
            7: "VII",
            8: "VIII",
            9: "IX",
            10: "X",
            40: "XL",
            50: "L",
            90: "XC",
            100: "C",
            400: "CD",
            500: "D",
            900: "CM",
            1000: "M"
        ]
    }
    
    func checkDictionary(number: Int) -> Bool {
        if numbersDict.keys.contains(number) {
            
            return true
        } else {
            return false
        }
        return false
    }
    
    func numberToArray(number: Int) -> [Int] {
        let forFragmentedArray = String(number).compactMap { Int(String($0)) }
        return forFragmentedArray
    }
    
    func transformation(arrayWithNumbers: [Int]) -> [Int] {
        var forDigitsArray: [Int] = []
        var degree:Int = arrayWithNumbers.count - 1
        var powerNumber: Double = pow(10.0, Double(degree))
        
        for n in 0..<arrayWithNumbers.count {
            
            let modifiedNumber:Int = arrayWithNumbers[n] * Int(powerNumber)
            forDigitsArray.append(modifiedNumber)
            degree = degree - 1
            powerNumber = pow(10.0, Double(degree))
            
        }
        
        
        return forDigitsArray
    }
    
    
    
    
    var roman: String? {
        
        var result = ""
        if checkDictionary(number: self) {
            return numbersDict[self]!
        }
        if self <= 0 {
            return nil
        }
        let fragmentedArray = numberToArray(number: self)
        let digitsArray = transformation(arrayWithNumbers: fragmentedArray)
        let len = digitsArray.count
        for i in 0 ..< digitsArray.count {
            let currentDigit = digitsArray[i]
            if currentDigit == 0 {
                continue
            }
            if checkDictionary(number: currentDigit) {
                result = result + numbersDict[currentDigit]!
            } else {
                //                let forCountOfCharacters: [Int] = numberToArray(number: digitsArray[i])
                let degree = len - i - 1
                let raz = Int(pow(10.0, Double(degree)))
                var containOrNotContain = false
                var numberWithoutZeros = currentDigit
                var tail = ""
                while containOrNotContain == false,
                      numberWithoutZeros > 0 {
                    if checkDictionary(number: raz) {
                        tail = tail + numbersDict[raz]!
                    }
                    numberWithoutZeros = numberWithoutZeros - raz
                    containOrNotContain = checkDictionary(number: numberWithoutZeros)
                    if containOrNotContain {
                        result = result + numbersDict[numberWithoutZeros]!
                    }
                }
                result = result + tail
            }
        }
        return result
    }
    
}

