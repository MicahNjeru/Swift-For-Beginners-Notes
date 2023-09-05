import Foundation


// Class definition
/// Classes require a constructor unlike Structs
/// They also require initializers as well
class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func increaseAge(){
        self.age += 1
    }
}

// Assigning variable to Person instance
let foo = Person(name: "Foo", age: 20)

// Reading values of "foo" variable
foo.name
foo.age
foo.increaseAge()
foo.age


// Reference types: they point to the same memory of the person instance
foo.age
let bar = foo
bar.increaseAge()
bar.age
foo.age
foo.age += 10

if foo === bar {
    "Foo and bar point to the same memory"
} else {
    "They don't point to the same memory"
}

// Sub-classing
class Vehicle {
    func goVroom() {
        "Vroom vroom"
    }
}

class Car: Vehicle {
    
}

let car = Car()
car.goVroom()


// Setting internal class variable as internal mutable only
class Human {
    private(set) var age: Int
    
    init(age: Int){
        self.age = age
    }
    
    func increaseAge() {
        self.age += 1
    }
}

let baz = Human(age: 20)
bar.age
bar.increaseAge()


/// Designated Initializers: construct an instance of the class by ensuring all property values & structure of the class
/// holds up.
/// Convenience initializers: add some logic & delegate initialization to the designated initializers

// Examples:
class Tesla {
    let manufacturer = "Tesla"
    let model: String
    let year: Int
    
    // Designated initilizer
    init() {
        self.model = "X"
        self.year = 2023
    }
    
    // Designated initilizer
    init(model: String, year: Int){
        self.model = model
        self.year = year
    }
    
    // Convenience initializer
    convenience init (model: String){
        self.init(model: model, year: 2023)
    }
}

// Sub-classing Tesla
// The convenience initializer cannot be called from the super class initializer
class TeslaModelY: Tesla {
    override init() {
        super.init(model: "Y", year: 2023)
    }
}

// ModelY instance
let modelY = TeslaModelY()
modelY.model
modelY.year
modelY.manufacturer

// Deinitilizers
class MyClass {
    init(){
        "Initilized"
    }
    
    func doSomething(){
        // something
    }
    
    deinit{
        "Deinitilized"
    }
}

// Deinitilization example
let myClosure = {
    let sampleClass = MyClass()
    sampleClass.doSomething()
}

myClosure()

