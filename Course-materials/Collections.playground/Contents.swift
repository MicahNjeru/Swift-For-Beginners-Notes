import Foundation


/// Collections: These are basically a collection of data such as Arrays & Dictionaries

// Array
let numbers = [1, 2, 3, 4]
numbers.first
numbers.last
numbers.count
numbers.map(-)

var mutatingNumbers = [4, 5, 6]
mutatingNumbers.append(7)
mutatingNumbers.insert(3, at: 0)
mutatingNumbers.insert(contentsOf: [1, 2], at: 0)

// Iterating over array values
for value in numbers {
    value
}

// Enumarating using pattern matching
for value in numbers where value % 2 == 0 {
    value
}

// Mapping: This is the function of taking values in collections and turning them into something completely different.

numbers.map { (value: Int) -> Int in
    value * 2
}

// We can filter elements in arrays
numbers.filter { (value: Int) -> Bool in
    value >= 3
}



