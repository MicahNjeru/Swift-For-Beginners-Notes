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

if foo === bar {
    "Foo and bar point to the same memory"
} else {
    "They don't point to the same memory"
}
