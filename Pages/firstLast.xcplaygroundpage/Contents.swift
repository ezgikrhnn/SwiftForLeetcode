//: [Previous](@previous)


import Foundation

func firstLast(_ arr: [Any]) -> [Any] {
   
    var newArray : [Any] = []
    if arr.count > 1 {
        newArray.append(arr[0])
        newArray.append(arr[arr.count-1])
        
        return newArray
    }
    return newArray
}
//print(firstLast(["eses", "eoeoeo", "ww0w0"]))




func grabCity(_ str: String) -> String {
    
    // Dizgi içerisindeki tüm köşeli parantez çiftlerini ayır
    let components = str.components(separatedBy: "[").last?.components(separatedBy: "]") //son elemanı alır
    
    print("components: \(components)")
    
    // Son köşeli parantez içindeki elemanı döndür
    if let city = components?.first {
        //city'nin başındaki ve sonundaki boşlukları vs temizle:
        return city.trimmingCharacters(in: .whitespacesAndNewlines)
    }else{
        return ""
    }
}

// Örnek kullanımlar
//print(grabCity("[Last Day!] Beer Festival [Munich]"))       // Çıktı: "Munich"



// Christmas Eve is almost upon us, so naturally we need to prepare some milk and cookies for Santa! Create a function that accepts a Date object and returns true if it's Christmas Eve (December 24th) and false otherwise. Keep in mind JavaScript's Date month is 0 based, meaning December is the 11th month while January is 0.


func timeForMilkAndCookies(_ cdate: Date) -> Bool {
    
    let calendar = Calendar.current
    print(calendar)
    
    //cdate tarihinden ayı ve günü al
    let components = calendar.dateComponents([.month, .day], from: cdate)
    
    if let month = components.month, let day = components.day{
        return month == 12 && day == 24
    }
    return false
}

let date1 = Calendar.current.date(from: DateComponents(year: 2013, month: 12, day: 24))!
print(timeForMilkAndCookies(date1))
