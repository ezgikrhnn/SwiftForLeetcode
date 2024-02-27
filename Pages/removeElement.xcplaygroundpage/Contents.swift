//: [Previous](@previous)

import Foundation

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        
    nums.removeAll{$0 == val}
    print(nums)

    return nums.count
}
var numbers = [1, 2, 3, 4, 3, 3]
let removedCount = removeElement(&numbers, 3)
print("Kaldırılan eleman sayısı: \(removedCount)")
