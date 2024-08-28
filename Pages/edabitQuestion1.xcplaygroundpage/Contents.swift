//: [Previous](@previous)

import Foundation

func getMiddle(_ str: String) -> String {
    let arr = Array(str)
    var newArr : [Character] = []
    var mid = 0
    
    if arr.count % 2 == 1 {
        mid = arr.count/2
        newArr.append(arr[mid])
       
    } else {
        mid = arr.count / 2
        newArr.append(arr[mid-1])
        newArr.append(arr[mid])
        print(newArr)
    }
    
    return(String(newArr))
}
var str = "ezgiş"
print(getMiddle(str))
