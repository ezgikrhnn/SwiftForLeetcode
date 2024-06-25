//: [Previous](@previous)
/*
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 */

import Foundation


func romanToInt(_ s: String) -> Int {
    
    let array = Array(s)
    var sum = 0
    print(array)
   
    // Roman rakamlarını ve karşılık gelen değerlerini tanımlayan sözlük
       let romanDictionary: [Character: Int] = [
           "I": 1, "V": 5, "X": 10, "L": 50,
           "C": 100, "D": 500, "M": 1000
       ]
 
        
    for i in 0..<array.count {
        //suanki karakterin değeri:
        let currentVal = romanDictionary[array[i]]!
        
        if i < array.count - 1 {
            let nextVal = romanDictionary[array[i+1]]!
            
            if currentVal < nextVal{
                //suanki değer bir sonraki değerden kucukse
                sum -= currentVal
            }else {
                sum += currentVal
            }
        }else {
            sum += currentVal
        }
    }
    
    return sum
    
}
print(romanToInt("LVIII"))
