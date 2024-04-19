//: [Previous](@previous)

/**
 Write a function:

 public func solution(_ A : inout [Int]) -> Int

 that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

 For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

 Given A = [1, 2, 3], the function should return 4.

 Given A = [−1, −3], the function should return 1.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 each element of array A is an integer within the range [−1,000,000..1,000,000].
 */

import Foundation

public func solution(_ A: inout [Int]) -> Int {
    let positives = Set(A.filter { $0 > 0 }) //dizideki her bir elemanın sıfırdan büyük olup olmadığını kontrol eder. Set() yerine Array de yazabilirdim aynı sonucu verir.
    
    var smallest = 1
    while positives.contains(smallest) {
        smallest += 1
    }
    return smallest
}

// Example usage:
var example1 = [1, 3, 6, 4, 1, 2]
var example2 = [-1, -3]
var example3 = [-1, 3, 2]
print(solution(&example1)) // Output should be 5
print(solution(&example2)) // Output should be 1
print(solution(&example3)) // Output should be 1
