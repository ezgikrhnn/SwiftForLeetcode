//: [Previous](@previous)

import Foundation

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var carry = 0 /// carry, sayıları toplarken bir önceki basamaktan gelen taşıma değerini temsil eder
    var dummyHead = ListNode(0) // dummyHead, sonucu tutacak bağlı listenin başlangıç düğümüdür
    var current: ListNode? = dummyHead // current, sonucu oluştururken bağlı listeyi gezen bir işaretçidir
    var p = l1
    var q = l2


    while p != nil || q != nil { //p nin veya q nun sonuna kadar dön
    // x ve y, işlem yapılacak düğümlerin değerleridir (eğer düğüm yoksa 0)
        let x = p?.val ?? 0
        let y = q?.val ?? 0
        let sum = x + y + carry

        carry = sum / 10

        current?.next = ListNode(sum % 10)
        current = current?.next

        p = p?.next
        q = q?.next
    }

     // Eğer döngü bittikten sonra carry değeri hala varsa, yeni bir düğüm eklenir
    if carry > 0 {
        current?.next = ListNode(carry)
    }

     // dummyHead'in bir sonraki düğümü (ilk düğümü) geri döndürülür
    return dummyHead.next
}


