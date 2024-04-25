//: [Previous](@previous)

/**A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.
 
 For example, number 9 has binary representation 1001 and contains a binary gap of length 2. The number 529 has binary representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3. The number 20 has binary representation 10100 and contains one binary gap of length 1. The number 15 has binary representation 1111 and has no binary gaps. The number 32 has binary representation 100000 and has no binary gaps.

 Write a function:

 public func solution(_ N : Int) -> Int

 that, given a positive integer N, returns the length of its longest binary gap. The function should return 0 if N doesn't contain a binary gap.

 For example, given N = 1041 the function should return 5, because N has binary representation 10000010001 and so its longest binary gap is of length 5.
 
 binaryGap birler arasında yer alan 0' dan oluşan en uzun 0 dizisidir.*/


//MARK: BINARY GAP QUESTION

import Foundation


public func solution(_ N : Int) -> Int {
    // Sayıyı ikili biçimde string olarak al ve bir diziye dönüştür
    let binaryArray = Array(String(N, radix: 2))
   
    
    var maxCount = 0  // En uzun sıfır dizisinin uzunluğunu tutacak
    var currentCount = 0  // Geçerli sıfır dizisinin uzunluğunu sayar
    var counting = false  // İlk '1' gördükten sonra saymaya başla
    
    // Diziyi dolaş
    for char in binaryArray {
        if char == "1" {
            if counting {  // Eğer '1' geldi ve sayıyorsak max'ı güncelle
                maxCount = max(maxCount, currentCount)  //ikisi arasından max'ı al
                currentCount = 0  // Sıfır sayıcısını sıfırla
            } else {
                counting = true  // İlk '1' ile karşılaştık, saymaya başla
            }
        }
        else if counting {
            currentCount += 1  // '0' geldi ve sayıyorsak, sayıcıyı artır
        }
    }
    
    return maxCount  // En uzun sıfır dizisini döndür
}

var number = 1041
print(solution(number))
