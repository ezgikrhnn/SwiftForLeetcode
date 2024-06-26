//: [Previous](@previous)

/*
 Write a function to find the longest common prefix string amongst an array of strings.
 
 If there is no common prefix, return an empty string "". */


func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.isEmpty {
        return ""
    }
    
    //birini alıp diğerleriyle karşılaştırma yöntemini uyguluyorum:
    var prefix = strs[0] //1. elemanı prefix olarak seçtim

    //arrayin diğer elemanlarıyla karşılaştırma yapıyorum:
    for a in strs{
        //suanki prefix, o stringin başlangıcında olmadıgı sürece:
        while !a.hasPrefix(prefix){
            prefix = String(prefix.dropLast())
            // Eğer prefix boş kaldıysa, boş string döndür
            if prefix.isEmpty {
                    return ""
            }
        }
    }
    return prefix
}

let array =  ["flower","flow","flight"]
print(longestCommonPrefix(array))
