//: [Previous](@previous)

import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
       var i = 0, j = 0, longest = 0
       var charCount = [Character : Int]()
       var characters = Array(s)
       
                   //0
       while j < characters.count {
           let char = characters[j]
                   //1
           if let lastIndex = charCount[char] {
               i = max(i, lastIndex + 1)
           }
                   //2
           charCount[char] = j
           longest = max(longest, j - i + 1)
           
           j += 1
       }
           //3
       return longest
   }

lengthOfLongestSubstring("abcabab")
