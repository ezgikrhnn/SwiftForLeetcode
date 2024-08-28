//: [Previous](@previous)

import Foundation

func maxPresentations(scheduleStart: [Int], scheduleEnd: [Int]) -> Int {
    // Etkinlikleri (start, end) çiftleri olarak bir araya getir
    //zip iki diziyi birleştirir tuple oluşturur.
    let events = zip(scheduleStart, scheduleEnd)
    
    // Etkinlikleri bitiş zamanlarına göre sıralama
    let sortedEvents = events.sorted { $0.1 < $1.1 }
    
    var count = 1 //min girilen event 1 tanedir
    var lastEndTime = -1
    
    // Her etkinliği kontrol et
    for event in sortedEvents {
        let (start, end) = event
        
        // Eğer etkinlik önceki etkinlikten sonra başlıyorsa
        if start > lastEndTime {
            count += 1
            lastEndTime = end
        }
    }
    
    return count
}

// Örnek kullanım
let scheduleStart = [1, 1, 2]
let scheduleEnd = [3, 2, 4]
print(maxPresentations(scheduleStart: scheduleStart, scheduleEnd: scheduleEnd))  // Çıktı: 2
