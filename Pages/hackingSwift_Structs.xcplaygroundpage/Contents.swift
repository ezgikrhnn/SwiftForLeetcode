//: [Previous](@previous)

//MARK: COMPUTED PROPERTIES:
// computed propertiler return etmek zorunda. orneğin if else içinde print değil return olacak.

struct Sport {
    var name: String
    var isOlympicSport: Bool
    var olympicStatus: String { //computer property
        if isOlympicSport {
            return "\(name) is an olympic sport"
        } else {
            return "\(name) is not an olympic sport"
        }
    }
}

let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)


struct Keyboard {
    var isMechanical = false
    var noiseLevel: Int {
        if isMechanical {
            return 11
        } else {
            return 3
        }
    }
    
}

let majestouch = Keyboard(isMechanical: true)
print(majestouch.noiseLevel)

struct Race {
    var distance: Int
    var runners = 0
    var description : String {
        return "This is a \(distance) km race with \(runners)"
    }
}

let londonMarathon = Race(distance: 42, runners:  40_000)


struct Wine {
    var age: Int
    var isVintage: Bool
    var price: Int {
        if isVintage {
            return age + 20
        } else {
            return age + 5
        }
    }
}

let malbec = Wine(age: 2, isVintage: true)
print(malbec.price)



