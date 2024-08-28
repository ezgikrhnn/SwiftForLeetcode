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





