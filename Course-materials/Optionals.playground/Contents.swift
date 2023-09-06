import Foundation

/// Optionals: Indicate values that might or might not be present.

func multiplyByTwo(_ value: Int? = nil) -> Int {
    if let value {
        return value * 2
    } else {
        return 0
    }
}


multiplyByTwo()
multiplyByTwo(2)
multiplyByTwo(nil)

// We can compare optionals with nil
let age: Int? = nil
if age != nil {
    "Age is there! How odd!"
} else {
    "Age is nil. Correct."
}

// Using guard statements
func checkAge(){
    if age == nil {
        "Age is nill as expected"
        return
    }
    // Guards should always return
    guard age != nil else {
        "Age is nill as expected"
        return
    }
    "Age is not nill here. Strange!"
}

checkAge()

// Using guard let to unwrap optionals
let age2: Int? = 0
func checkAge2(){
    guard let age2 else {
        "Age is nill. How strange!"
        return
    }
    "Age2 is not nill as expected. Value is \(age2)"
}

checkAge2()

// You can switch on optionals
switch age {
case .none:
    "Age has no value as expected"
    break
case let .some(value):
    "Age has the value of \(value)"
    break
}

// Simple comparisons
if age2 == 0 {
    "Age2 is 0 as expected, and is not nill"
} else {
    "Age 2 is not 0. How strange!"
}

// Same case as above
if age2 == .some(0) {
    "Age2 is 0 as expected, and is not nill"
} else {
    "Age 2 is not 0. How strange!"
}

// Optional Chaining
struct Person {
    let name: String
    let address: Address?
    
    struct Address {
        let firstLine: String?
    }
}

let foo = Person(name: "Foo", address: nil)

if let fooFirstAddressLine = foo.address?.firstLine {
    fooFirstAddressLine
} else {
    "Foo doesn't have an address with first line as expected."
}

// Step by step optional chaining
if let fooAddress = foo.address,
    let firstAddress = fooAddress.firstLine {
    fooAddress
    firstAddress
}

// Comparig optionals using chaining
let bar: Person? = Person(name: "Bar", address: Person.Address(firstLine: nil))

if bar?.name == "Bar",
    bar?.address?.firstLine == nil {
    "Bar's name is bar and has no first line of address"
    } else {
        "Seems like something isn't working right"
    }


