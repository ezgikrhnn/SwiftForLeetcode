/**
 VALID PHARENTHESES
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Every close bracket has a corresponding open bracket of the same type.
  

 Example 1:

 Input: s = "()"
 Output: true
 Example 2:

 Input: s = "()[]{}"
 Output: true
 Example 3:

 Input: s = "(]"
 Output: false
 */
import Foundation

var greeting = "Hello, playground"

func isValid(_ s: String) -> Bool {
        
    let validCharacters: Set<Character> = ["(", ")", "{", "}", "[", "]"]
    
    // Geçersiz karakter içeren stringleri direkt olarak false olsun
        guard s.allSatisfy({ validCharacters.contains($0) }) else {
            return false
        }
        
    var characterArray = [Character]() //stackdir.
    
    //parantezler için bir küme:
    let matchingParenthesesDisct: [Character: Character] = [")": "(", "}": "{", "]": "["]
    
    //girilen string üzerindeki her karakteri kontrol ediyoruz:
    for char in s{
        //eger char açma parantezi ise stacke ekledik:
        if matchingParenthesesDisct.values.contains(char){
            characterArray.append(char)
            
        }else if let expectedOpen = matchingParenthesesDisct[char]{
            //eger char kapanma karakteri ise, stackin son elemanı kontrol edilir.
            if characterArray.last == expectedOpen{
                characterArray.removeLast() //eşleşirse arrayden çıkar
            }else{
                return false //eşleşmiyorsa false döndür.
            }
        }
    }
    
    //array boşsa zaten eşleşme vardır.
    return characterArray.isEmpty
}

let ss = "(]{]"
print(isValid(ss))
