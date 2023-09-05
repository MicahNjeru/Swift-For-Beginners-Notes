import Foundation

/// Protocols is a set of rules that objects have to conform to when they implement them.
/// They can function declaratios without implementations unlike Structs & Classes

protocol CanBreathe {
    func Breath()
}

// Example struct using and conforming to "CanBreathe" protocol
struct Animal: CanBreathe {
    func Breath() {
        "Animal breathing..."
    }
}

struct Person: CanBreathe{
    func Breath() {
        "Person breathing"
    }
}
let dog = Animal()
dog.Breath()
let person = Person()
person.Breath()

/// Protocols can't have functional functions declared inside them
/// we have to use an "extension" to add the functionality to the protocol

// Example
protocol CanJump {
    func jump()
}

// Extantiating
extension CanJump {
    func jump(){
        "Jumping..."
    }
}

/// Extantiating has an additional benefit to those that conform to it. The objects that conform to it don't
/// have to implement the functions. The objects can also change the function from the extantiated protocol
struct Cat: CanJump{
    
}

let cat = Cat()
cat.jump()


// Getters & setters in protocols
protocol HasName{
    var name: String { get }
    var age: Int { get set }
}

// Extension to protocol function that returns a value
extension HasName {
    func describeMe() -> String {
        "Your name is \(name) and you are \(age) years old."
    }
}

struct Dog: HasName {
    var name: String
    var age: Int
}

var woof = Dog(name: "Woof", age: 10)

woof.name
woof.age
woof.age += 1
woof.age
woof.describeMe()



