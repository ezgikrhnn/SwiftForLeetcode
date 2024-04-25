//: [Previous](@previous)

/** QUESTION:
 You parked your car in a parking lot and want to compute the total cost of the ticket. The billing rules are as follows:

 The entrance fee of the car parking lot is 2;
 The first full or partial hour costs 3;
 Each successive full or partial hour (after the first) costs 4.
 You entered the car parking lot at time E and left at time L. In this task, times are represented as strings in the format "HH:MM" (where "HH" is a two-digit number between 0 and 23, which stands for hours, and "MM" is a two-digit number between 0 and 59, which stands for minutes).

 Write a function:

 public func solution(_ E : inout String, _ L : inout String) -> Int

 that, given strings E and L specifying points in time in the format "HH:MM", returns the total cost of the parking bill from your entry at time E to your exit at time L. You can assume that E describes a time before L on the same day.

 For example, given "10:00" and "13:21" your function should return 17, because the entrance fee equals 2, the first hour costs 3 and there are two more full hours and part of a further hour, so the total cost is 2 + 3 + (3 * 4) = 17. Given "09:42" and "11:42" your function should return 9, because the entrance fee equals 2, the first hour costs 3 and the second hour costs 4, so the total cost is 2 + 3 + 4 = 9.

 Assume that:

 strings E and L follow the format "HH:MM" strictly;
 string E describes a time before L on the same day.
 In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.*/

import Foundation

public func solution(_ E : inout String, _ L : inout String) -> Int {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    
    let enter = dateFormatter.date(from: E)
    let leave = dateFormatter.date(from: L)
    
    guard let enter = dateFormatter.date(from: E),
          let leave = dateFormatter.date(from: L) else {
        return -1 // Hatalı tarih formatı durumunda hata değeri dön
    }
    
    let calendar = Calendar.current
    let components = calendar.dateComponents([.hour, .minute], from: enter, to: leave) //int değerlerinde
    
    
    if let hours = components.hour, let minutes = components.minute {
        return calculatePay(minutes: minutes, hours: hours)
        
    } else {
        return -1
    }
    
    
    func calculatePay( minutes : Int, hours : Int) -> Int{
        
        let certainPay = 5 // 2 + 3
        let additionalRate = 4
        let additionalHours = (minutes > 0) ? hours + 1 : hours
        
        return certainPay + (additionalHours - 1) * additionalRate
    }
    
}
var enter = "12:21"
var leave = "13:22"
print(solution(&enter, &leave))
