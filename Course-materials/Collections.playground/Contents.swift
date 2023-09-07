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

// Compact mapping: combination of map and filter and returns an optional
numbers.compactMap{ (value: Int) -> String? in
    value % 2 == 0 ? String(value) : nil
}

// Arrays can also contain nil
let numbers2: [Int?] = [1, 2, nil, 4, 5]
numbers2.count

// Filtering nil from array. We use compactMap
let filtered = numbers2.compactMap { (value: Int?) -> Bool in
    value != nil
}

// Arrays can have more than 1 data type
// Although you have to mark the array as "Any" as it's data type
let things: [Any] = [1, "Hello", 2, "World"]

things.count

/// Sets: Special collection that contains only UNIQUE values
/// It checks the uniqueness by comparing the hash values and equalities
/// Set's also do not guarantee ordering.
/// They can contain nil

let unique = Set([1, 2, 3, 2, 1, 3])
unique.count
unique.map(-)

let myNumbers = Set([1, 2, 3, 4, 5, nil])
let notNilNumbers = Set(myNumbers.compactMap{
    $0
})

notNilNumbers

// Sets can have more than 1 data type
let stuff: Set<AnyHashable> = [1, 2, 3, "Micah"]
stuff.count

// Grabbing values with specific data types
let intsInThings = things.compactMap{(value: Any) -> Int? in
    value as? Int
}
intsInThings.count


/// Dictionaries: These are Key: Value pairs of collections
// Example Dictionary
let userInfo: [String: Any] = [
    "Name": "Foo",
    "Age": 20,
    "Address": [
        "Line 1": "Address Line 1",
        "Postcode": "12345"
    ]
]

userInfo["Name"]
userInfo["Age"]
userInfo["Address"]


userInfo.keys
userInfo.values
for (key, value) in userInfo {
    print("\(key): \(value)")
}

