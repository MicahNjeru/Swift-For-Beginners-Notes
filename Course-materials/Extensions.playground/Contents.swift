import Foundation


/// Extensions add functionality to existing types. They can "extend" existing types
/// "Self" refers to the value passed itself
extension Int {
    func plusTwo() -> Int {
        self + 2
    }
}

let two = 2
two.plusTwo()


/// Using extensions, you can add initializers to existing types
/// For instance, the only initializer in structs can be extended to cover other custom functionalities

struct Person {
    let firstName: String
    let lastName: String
}

// We're adding a new constructor to Person's initializer
extension Person {
    init(fullName: String) {
        let components = fullName.components(separatedBy: " ")
        self.init(firstName: components.first ?? fullName, lastName: components.last ?? fullName)
    }
}

let person = Person(fullName: "Foo Bar")
person.firstName
person.lastName

// We can extend existing types and add protocols to existing types
protocol GoesVroom {
    var vroomValue: String { get }
    func goVroom() -> String
}

extension GoesVroom {
    func goVroom() -> String {
        "\(self.vroomValue) goes vroom!"
    }
}

struct Car {
    let manufacturer: String
    let model: String
}

let modelX = Car(manufacturer: "Tesla", model: "X")

extension Car: GoesVroom {
    var vroomValue: String {
        "\(self.manufacturer) model \(self.model)"
    }
}

modelX.goVroom()

// Extensions on classes with convenience initializers
class MyDouble {
    let value: Double
    init(value: Double){
        self.value = value
    }
}

extension MyDouble {
    convenience init() {
        self.init(value: 0)
    }
}

let myValue = MyDouble()
myValue.value


