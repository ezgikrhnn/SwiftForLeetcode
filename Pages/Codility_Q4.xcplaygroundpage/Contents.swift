//: [Previous](@previous)

/*

 Önce, olası en küçük maksimum blok toplamını ve en büyük maksimum blok toplamını tanımlayın:

 Minimum değer, dizideki en büyük tek eleman olabilir (çünkü her blok en az bir eleman içermelidir).
 Maksimum değer, dizinin tüm elemanlarının toplamı olabilir (çünkü tüm diziyi tek bir blok olarak alabiliriz).
 */
import Foundation

var greeting = "Hello, playground"

public func solution(_ K: Int, _ M: Int, _ A: inout [Int]) -> Int {
    
    // İç fonksiyon olarak canPartition tanımlanıyor.
    //Bu fonksiyon, verilen bir maxBlockSum değeriyle diziyi K bloğa bölebilip bölemediğimizi kontrol eder.
    func canPartition(_ A: [Int], maxBlockSum: Int, K: Int) -> Bool {
        var currentSum = 0
        var blocksNeeded = 1  // İlk blok için

        for num in A {
            if currentSum + num > maxBlockSum {
                // Yeni bir blok başlat
                blocksNeeded += 1
                currentSum = num
                if blocksNeeded > K {  // Daha fazla bloğa ihtiyaç varsa, başarısız
                    return false
                }
            } else {
                currentSum += num
            }
        }
        return true
    }

    let totalSum = A.reduce(0, +)
    var left = A.max() ?? 0 //dizideki en büyük değer
    var right = totalSum    //dizinin toplamı
    var result = right
    
    while left <= right {
        let mid = (left + right) / 2
        if canPartition(A, maxBlockSum: mid, K: K) {
            result = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return result
}


var numbers = [2, 1, 5, 1, 2, 2, 2]
print(solution(3, 5, &numbers))

