//: [Previous](@previous)


//MARK: - USING CLOSURES AS PARAMETERS WHEN THEY RETURN VALUES

func playSong(_ name: String, notes: () -> String){
    print("alsdjasjd")
    let playedNotes = notes()
    print(playedNotes)
}

playSong("şsdlcşldskf") {
    return "ododood"
}


func encrypt(password: String, using algorithm: (String)-> String ){
    print("encryp password..")
    let result = algorithm(password)
    print("the result is \(result)")
}

encrypt(password: "taylor") { (password:String) in
    print("using top secret encription!")
    return "secret" + password + "secret"
}

func bakeCookies(number: Int, secretIngredients: () -> String) {
    for _ in 0..<number {
        print("adding butter")
        print("adding flour")
        let extra = secretIngredients()
        print(extra)
    }
}

bakeCookies(number: 40) {
    return "vanilla extract"
}


// MARK: - CLOSURES WITH MULTIPLE PARAMETERS
//closurelarda tek return değeri varsa return yazmaya gerek bile yoktur.
//ve ayrıca parametreler closure olarak geçilebilir.

func travel(action: (String, Int) -> String ){
    print("I am getting ready to go")
    let description = action("London", 60)
    print(description)
    print("I arrived")
}
travel {
    "I'm going to \($0) at \($1) miles per hour " // return yazmadım zaten tek değer.
}


func buyDevices(name: String, count: Int, configurator: (String) -> String) {
    print("I'm buying \(count)x\(name).")
    for _ in 0..<count {
        let configuredDevice = configurator(name)
        print(configuredDevice)
    }
}

func runBarbecue(foods: [String], grillTechnique: (String, Int)-> Void) {
    let spiceLevel = 10
    for food in foods {
        grillTechnique(food, spiceLevel)
    }
}

func printDocument(_ document: String, configurationCheck: (String, Int) -> Bool) {
    let copies = 1
    let isAllowed = configurationCheck(document, copies)
    if isAllowed {
        print("işlem yapılmasına izin verilir")
    }else {
        print("işlem yapılmasına izin verilmez")
    }
}

func sendNewLetter(getRecipients: () -> [String]){
    let recipients = getRecipients()
    for person in recipients {
        print("I am sending an email to \(person)")
    }
}

func authenticate(algorithm: (String, String) -> Bool ) {
    print("authenticating user")
    let username = "twotraws"
    let password = "frosties"
    let result = algorithm(username, password)
    if result {
        print("you are in")
    } else {
        print("try again")
    }
}

func sleep(haveDream: () -> String) {
    print("ywan,, time for bed")
    let dream = haveDream()
    print("I had a dream about \(dream)")
}

func playSong(instrumentClosure: (String, Int)-> Void) {
    let song = "Stairway  to heaven"
    let volume = 11
    print("I'm going to play \(song)...")
    instrumentClosure(song, volume)
}

func runBarbecue(foods: [String], grillTechnuque: (String, Int) -> Void) {
    let spiceLevel = 10
    for food in foods {
        grillTechnuque(food, spiceLevel)
    }
}

func raceCar(with closure: (String, String) -> String) {
    let driver = "Levis Hamilton"
    let team = "Mercedes"
    let raceResult = closure(driver, team)
    print("the result is in: \(raceResult)!")
}

func sendNewsLetter(getRecipients: () -> [String]) {
    let recipients = getRecipients()
    for person in recipients {
        print("I am sending an email to \(person)")
    }
}


// MARK: RETURNING CLOSURES

func travel() -> (String) -> Void {
    return {
        print("I am going to \($0)")
    }
}

let result = travel()
result("london")



func createValidator() -> (String) -> Bool {
    return {
        if $0 == "twostraws" {
            return true
        } else {
            return false
        }
    }
}

let validator = createValidator()
print(validator)


func createDoubler() -> (Int) -> Int {
    return {
        return $0 * 2 //closureın returnu
    }
}

let doubler = createDoubler()
print(doubler)


func makeRecover(media: String) -> () -> String {
    
    switch media {
     case "podcast" :
        return {
            return  "I am recording a podcast"
        }
    default:
        return {
            return  "I am recoring a video"
        }
    }
}

let recorder = makeRecover(media: "podcast")
print(recorder())


func paintingMaker(medium: String) -> (String) -> Void {
    if medium == "watercolor" {
        return { param in // _ da olsa parametre alıyor
            print("I am \(param) and I'm going to paint some flowers") //clsouredn geldi, sonucu
        }
    } else {
        return { param in
            print("I'm \(param) and I'm going to paint a landscape.") //closuredan geldi. closure sonucu
        }
    }
}
let str = "ezgi"
let maker = paintingMaker(medium: "watercolor")
maker(str)



func mealProducer() -> (Int) -> String {
    return {
        return "I will make dinner for \($0) people."
    }
}
let makeDinner = mealProducer()
print(makeDinner(5))



func createAgeCheck(strict: Bool) -> (Int) -> Bool {
    if strict {
        return {
            if $0 <= 21 {
                return true
            } else {
                return false
            }
        }
    } else {
        return {
            if $0 <= 18 {
                return true
            } else {
                return false
            }
        }
    }
}

let ageCheck = createAgeCheck(strict: true)
let resutlt = ageCheck(20)
print(result)


// MARK: CAPTURING VALUES

func handOutBusinessCards() -> () -> Void {
    var number = 0
    return {
        number += 1
        print("Number handed out: \(number)")
    }
}

let handOut = handOutBusinessCards()
handOut()
handOut()


func createAgeValidator(strict: Bool) -> (Int) -> Bool {
    return {
        if strict {
            if $0 >= 21 {
                return true
            }
        } else {
            if $0 >= 18 {
                return true
            }
        } 
        return false
    }
}

let validator1 = createAgeValidator(strict: true)
validator1(21)



func makeAdder() -> (Int) -> Void {
    var sum = 0
    return {
        sum += $0
        print("Sum is now \(sum)")
    }
}
let adder = makeAdder()
adder(5)
adder(3)


func visitPlaces() -> (String) -> Void {
    var places = [String: Int] ()
    return {
        places[$0, default : 0] += 1
        let timesVisited = places[$0, default: 0]
        print("Number of times I have visited \($0): \(timesVisited)")
    }
}

let visit = visitPlaces()
visit("London")
visit("Newyork")
visit("London")


func summonGenie(wishCount: Int) -> (String) -> Void {
    var currentWishes = wishCount
    return {
        if currentWishes > 0 {
            currentWishes -= 1
            print("You wished for \($0).")
            print("Wishes left: \(currentWishes)")
        } else {
            print("you are out of the wishes")
        }
    }
}

let genie = summonGenie(wishCount: 3)
genie("Being an ios developer")
