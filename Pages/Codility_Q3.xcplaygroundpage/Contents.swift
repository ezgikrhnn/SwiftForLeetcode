//: [Previous](@previous)

/**
 
 soruda istenilen şudur:
 
Verilen bir string içindeki kelimeler arasından:
    - Yalnızca alfanümerik karakterler içeren,
    - Harf sayısı çift ve rakam sayısı tek olan en uzun kelimenin uzunluğunu bulmaktır.
      Eğer böyle bir kelime yoksa -1 döndürmelidir.
 */

import Foundation


import Foundation

public func solution(_ S: inout String) -> Int {
    
    // S string'ini boşluklara göre böl ve kelimeleri bir diziye al
    let words = S.components(separatedBy: " ")
    var maxLength = -1

    // Her kelimeyi döngü ile kontrol et
    for word in words {
        
        // Kelimenin alfanümerik olup olmadığını kontrol et
        if word.range(of: "^[a-zA-Z0-9]+$", options: .regularExpression) == nil {
            continue
        }
        
        // Harf ve rakam sayılarını say
        var letterCount = 0
        var digitCount = 0
        for character in word {
            if character.isLetter {
                letterCount += 1
            } else if character.isNumber {
                digitCount += 1
            }
        }

        // Harf sayısı çift ve rakam sayısı tek mi kontrol et
        if letterCount % 2 == 0 && digitCount % 2 == 1 {
            // Mevcut kelimenin uzunluğu maksimumdan büyükse güncelle
            if word.count > maxLength {
                maxLength = word.count
            }
        }
    }

    // En uzun geçerli kelimenin uzunluğunu döndür
    return maxLength
}

// Kullanım örneği
var testString = "test 5 a0A pass007 ?xy1"
print(solution(&testString))  // Çıktı: 7
