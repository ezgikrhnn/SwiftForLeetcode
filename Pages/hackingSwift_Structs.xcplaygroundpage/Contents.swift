//: [Previous](@previous)
// MARK: STRUCTS

/**
 Swift her struct için bir varsayılan initializer sağlar. Eğer tüm değişkenlere dışarıdan değer atılabiliyorsa yani (publicse) init kullanmaya gerek yoktur.
 Fakat struct değişkenlerine özel bir işlem uygulamak istediğinde init kullanmalısın. Orneğin değişkeni 2 ile çarpmak gibi.
 */
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


// MARK: PROPERTY OBSERVES
//property observer constant olamaz. --> VAR olmak zorundadır.
// property observer return olmak zorunda değildir. print de olabilir.
struct Progress {
    var task: String
    var amount: Int { //didSet print alabilir. return olmak zorunda değildir.
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80


// MARK: METHODS
// structlar içine functions alabilir. bunlara method diyoruz.

struct Venue {
    var name: String
    var maxCapacity: Int
    func makeBooking(for people: Int) {
        if people > maxCapacity {
            print("sorry we can only accomadate \(maxCapacity).")
        } else {
            print("\(name) is all yours!")
        }
    }
}

struct Pokemon {
    var name: String
    func attack(with attackType: String) {
        print("\(name) uses \(attackType)!")
    }
}

// MARK: MUTATING METHODS
// struct içinde verilmiş değeri fonksiyon içinde değiştirmek istiyorsan mutating func kullanacaksın.

struct Surgeron {
    var operationsPerformed = 0 //dgeeri değiştirmek
    mutating func operate(on petient: String) {
        print("Nurse, hand me the scalpel!")
        operationsPerformed += 1
    }
}

// MARK: INITIALIZERS
       
// initializer struct, enum ve classta kullanılır.
struct User {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user = User()
user.username = "twostraws"


struct Starship {
    var name: String
    var maxWarp: Double
    init(starshipName: String, maxWarp: Double){
        name = starshipName
        self.maxWarp = maxWarp
    }
}
let voyager = Starship(starshipName: "Voyager", maxWarp: 3.04)


struct Sport3 {
    var name: String
    var isOlympicSport: Bool
}
let chessBoxing4 = Sport3(name: "pepepe", isOlympicSport: false)


struct Message {
    var from: String
    var to: String
    var content: String
    init() {
        from = "unknown"
        to = "unknown"
        content = "yo"
    }
}
let message = Message()


struct Country {
    var name: String
    var usesImperialMeasurements: Bool
    init(countryName: String) {
        name = countryName
        let imperialCountries = ["Liberia", "Myanmar", "USA"]
        if imperialCountries.contains(name) {
            usesImperialMeasurements = true
        } else {
            usesImperialMeasurements = false
        }
    }
}

// MARK: REFERRING TO THE CURRENT INSTANCE

// init içinde tüm değişkenler başlatılmalıdır.
struct Parent {
    var numberOfKids: Int
    var tirednessPercent: Int
    init(kids:Int) {
        self.numberOfKids = kids
        self.tirednessPercent = 0 // varsayılan bir değer verebilirsin
    }
}
let james = Parent(kids: 2)


struct Kitchen {
    var utensils: [String]
    init(utensils: [String]) {
        self.utensils = utensils
    }
}


struct District {
    var number: Int
    var supervisor: String
    init(number: Int, supervisor: String) {
        self.number = number
        self.supervisor = supervisor
    }
}

let district = District(number: 9, supervisor: "unknown")

struct FrameWork {
    var name: String
    var language: String
    init(name: String, language: String) {
        self.name = name
        self.language = language
    }
}
let vapor = FrameWork(name: "Vapor", language: "Swift")


// MARK: LAZY PROPERTIES
// lazy properties bir classta ya da structa kullanılan ancak ilk kez erişildiğinde hesaplanan ve başlatılan yapılardır. Asıl amacı maliyeti, bellek ve kaynak kullanımını azaltmaktır. Lazy properti'ler yalnızca VAR olarak tanımlanabilir.

struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person {
    var name: String
    lazy var familyTree = FamilyTree()
    init(name: String) {
        self.name = name
    }
}
var ed = Person(name: "Ed")
ed.familyTree //bu şekilde kullanım yapılabilir.


// MARK: STATIC PROPERTIES

//static bir değişkeni değiştirmek veya ona erişmek istersek sınıf üzerinden erişim yapmak gerekiyor.
// static let ya da var alabilir.
struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}
let ed1 = Student(name: "Ed")
let taylor = Student(name: "Taylor")
print(Student.classSize)


struct Person1 {
    static var population = 0
    var name: String
    
    init(personName: String) {
        name = personName
        Person1.population += 1
    }
}

let person1 = Person1(personName: "James")
let person2 = Person1(personName: "Ezgi")
print(Person1.population)

struct Raffle {
    static var ticketsUsed = 0
    var name: String
    var tickets: Int
    init(name: String, tickets: Int) {
        self.name = name
        self.tickets = tickets
        Raffle.ticketsUsed += tickets //gordugun gibi statice sınfı içinden erişim yapıyorum.
    }
}

struct NewsStory {
    static var BreakingNewsCount = 0
    static var regularNewsCount = 0
    var headline: String
    init(headline: String, isBreaking: Bool) {
        self.headline = headline
        if isBreaking {
            NewsStory.BreakingNewsCount += 1
        }
        else {
            NewsStory.regularNewsCount += 1
        }
    }
}

struct LegoBrick {
    static var numberMade = 0
    var shape: String
    var color: String
    init(shape: String, color: String) {
        self.shape = shape
        self.color = color
        LegoBrick.numberMade += 1
    }
}

// MARK: ACCESS CONTROL

struct Person2 {
    var id: String
    init(id: String) {
        self.id = id
    }
    func identify() -> String {
        return "my social security id is \(id)"
    }
}

let person3 = Person2(id: "12345")


struct School {
    var staffNames: [String]
    private var studentNames: [String]
    init(staff: String...) {
        self.staffNames = staff
        self.studentNames = [String]()
    }
}
let royalHigh = School(staff: "Mr Hughes")


struct Toy {
    var customerPrice: Double
    private var actualPrice: Int
    init(price: Int) {
        actualPrice = price
        customerPrice = Double(actualPrice * 2)
    }
}

let buzz = Toy(price: 10)


struct School2 {
    var staffNames: [String]
    private var studentNames : [String]
    init(staff: String...) { // ... kullanmak değişken parametre demektir.
        self.staffNames = staff
        self.studentNames = [String]()
    }
}
let royal = School(staff: "Mrs Hughes")
let royal1 = School(staff: "Mrs Hughes", "Mr Smith", "Ms Johnson") // ... oldugu için çoklu parametre verilebilir.


struct Person3 {
    private var socialSecurityNumber: String
    init(ssn: String) {
        socialSecurityNumber = ssn
    }
}
let sarah = Person3(ssn: "555-55-5555")

//swiftte struct yapısında bir init oluşturmaya gerek yoktur cunku structta swif totomatik olarak initializer başlatır zaten.
struct FacebookUser {
    public var privatePosts: String
    public var publicPosts: String
}
let user3 = FacebookUser(privatePosts: "weheheh", publicPosts: "lalal")


struct Office {
    private var passCode: String
    var address: String
    var employees: [String]
    init(address: String, employees: [String]) {
        self.address = address
        self.employees = employees
        self.passCode = "secret"
    }
}
