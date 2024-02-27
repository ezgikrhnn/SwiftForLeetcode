//: [Previous](@previous)

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    //dict yapısı altında for döngüsü ile kontrolleri sağlayacağım:
    var indexDict = [Int : Int]() //boş dict
    
    for(index, num) in nums.enumerated(){
        let complement = target - num
       
        
        if let complementIndex = indexDict[complement]{
            
            print([complementIndex, index])
            return [complementIndex, index]
        }
        indexDict[num] = index
            
    }
    
    return []
}

twoSum([1,4,3,3,6], 5)

