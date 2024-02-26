//: [Previous](@previous)
import Foundation

func isPalindrome(_ x: Int) -> Bool {
    
   
    var array = String(x).compactMap({ $0.wholeNumberValue})
    var emptyArray : [Int] = []
    var val : Bool = false
    
    if x < 0 {
        val = false
    }else{
        for i in stride(from: array.count-1, through: 0, by: -1){
           
            emptyArray.append(array[i])
            
        }
        if emptyArray == array {
            val = true
        }else{
            val = false
        }
        
    }
    return val
}

isPalindrome(-121)
