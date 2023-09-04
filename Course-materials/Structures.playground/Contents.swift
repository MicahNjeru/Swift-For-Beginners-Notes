import Foundation

// Structures are a way of grouping data and they are explicitlycv"Value types"
struct Person {
    let name: String
    let age: Int
}

// We can create a variable and assign it the structure we created above
let foo = Person(
    name: "Foo",
    age: 20
)

// We can access "foo" variable data using ./"dot" notation
foo.age
foo.name

// Struct with initializer values

struct Macbook {
    let name: String
    let manufacturer: String
    init(name: String) {
        self.name = name
        self.manufacturer = "Apple Inc."
    }
}

let mac = Macbook(name: "Macbook pro")

// Accessing the data in "mac" variable
mac.name
mac.manufacturer


// Struct with default values but no initializer
struct Macintosh {
    let name: String
    let manufacturer = "Apple Inc."
}

let macbookpro = Macintosh(name: "Macbook Pro M2")

// Accessing the data in "macbookpro" variable
macbookpro.manufacturer
macbookpro.name

/// Computed properties in structs (Structures)

struct Human {
    let firstName: String
    let lastName: String
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

let fooBar = Human(firstName: "Foo", lastName: "Bar")

// Accessing "fooBar" values
fooBar.firstName
fooBar.lastName
fooBar.fullName

// Creating structures that are mutable
struct Car {
    var currentSpeed: Int
    mutating func drive(speed: Int) {
        "Driving..."
        currentSpeed = speed
    }
}

let immutableCar = Car(currentSpeed: 10)

var mutableCar = Car(currentSpeed: 10)

let copyOfMutableCar = mutableCar
mutableCar.drive(speed: 30)

mutableCar.currentSpeed
copyOfMutableCar.currentSpeed

/// Structs cannot subclass other structures
struct LivingThing {
    init() {
        "I'm a living thing"
    }
}
// The code below cannot work, it's attempting to subclass a struct

//struct Animal: LivingThing {
//
//}

// Instead, to "copy" the structure, we do the following
struct Bike {
    let manufacturer: String
    let currentSpeed: Int
    func copy(currentSpeed: Int) -> Bike {
        Bike (
            manufacturer: self.manufacturer,
              currentSpeed: currentSpeed
        )
    }
}

let bike1 = Bike(
    manufacturer: "HD",
    currentSpeed: 20
)

var bike2 = bike1.copy(currentSpeed: 30)
let bike3 = bike1.copy(currentSpeed: 20)

