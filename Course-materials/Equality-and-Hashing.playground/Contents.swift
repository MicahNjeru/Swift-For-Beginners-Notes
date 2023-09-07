import Foundation


/// Equality & Hashing
/// Equality is provided in Swift using the Equatable Protocol
struct Person: Equatable {
    let id: String
    let name: String
}

let foo = Person(id: "1", name: "Foo")
let foo2 = Person(id: "1", name: "Bar")

if foo == foo2 {
    "They are equatable"
} else {
    "They are not equatable"
}

// We can override equality
//extension Person {
//    static func == (
//        lhs: Self,
//        rhs: Self
//    ) -> Bool {
//        lhs.id == rhs.id
//    }
//}


/// Hashable: Similar to equitable
struct House: Hashable {
    let number: Int
    let number0fBedrooms: Int
}

let house1 = House(number: 123, number0fBedrooms: 2)
let house2 = House(number: 123, number0fBedrooms: 3)

house1.hashValue
house2.hashValue


struct NumberedHouse: Hashable {
    let number: Int
    let numberOfBedrooms: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.number == rhs.number
    }
}

let house3 = NumberedHouse(number: 123, numberOfBedrooms: 3)
let house4 = NumberedHouse(number: 123, numberOfBedrooms: 4)

