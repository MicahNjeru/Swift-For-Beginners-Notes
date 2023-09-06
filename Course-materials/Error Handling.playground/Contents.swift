import Foundation

/// Error Handling: The science & art of telling something has gone wrong and how to handle it.

struct Person {
    let firstName: String?
    let lastName: String?
    
    enum Errors: Error {
        case firstNameIsNil
        case lastNameIsNil
        case bothNamesAreNil
    }
    
    func getFullName() throws -> String {
        switch (firstName, lastName) {
        case (.none, .none):
            throw Errors.bothNamesAreNil
        case (.none, .some):
            throw Errors.firstNameIsNil
        case (.some, .none):
            throw Errors.lastNameIsNil
        case let (.some(firstName), .some(lastName)):
            return "\(firstName) \(lastName)"
        }
    }
}

let foo = Person(firstName: "Foo", lastName: nil)

// When using throw statements, we need to use do-try to "catch" the "thrown" errors
do {
    let fullName = try foo.getFullName()
} catch {
    "Got an error \(error)"
}

// Using general-specific errors from the struct
do {
    let fullName = try foo.getFullName()
    fullName
} catch is Person.Errors {
    "Got an error"
}

// How to catch specific errors without know which error it is
let bar = Person(firstName: nil, lastName: nil)

do {
    let fullName = try bar.getFullName()
    fullName
} catch Person.Errors.firstNameIsNil {
    "First name is nil"
} catch Person.Errors.lastNameIsNil {
    "Last name is nil"
} catch Person.Errors.bothNamesAreNil {
    "Both name are nill"
} catch {
    "Some other error was thrown"
}


// Error handling with parameters in structs
struct Car {
    let manufacturer: String
    
    enum Errors: Error {
        case invalidManufacturer
    }
    
    init(manufacturer: String) throws {
        if manufacturer.isEmpty {
            throw Errors.invalidManufacturer
        }
        self.manufacturer = manufacturer
    }
}

do {
    let myCar = try Car(manufacturer: "")
} catch Car.Errors.invalidManufacturer {
    "Invalid manufacturer"
} catch {
    "Some other error"
}

// How to "optionally" call a function that throws
if let yourCar = try? Car(manufacturer: "Tesla") {
    "Success! Your car is \(yourCar)."
} else {
    "Failed to construct and error is not accessible now."
}

// Re-throws: A function that internally calls another function which can also throw
func fullName(
    firstName: String?,
    lastName: String?,
    calculator: (String?, String?) throws -> String?) rethrows -> String? {
        try calculator(firstName, lastName)
}


enum NameErrors: Error {
    case firstNameIsInvalid
    case lastNameIsInvalid
}

func + (firstName: String?, lastName: String?) throws -> String? {
    guard let firstName, !firstName.isEmpty else {
        throw NameErrors.firstNameIsInvalid
    }
    guard let lastName, !lastName.isEmpty else {
        throw NameErrors.lastNameIsInvalid
    }
    return "\(firstName) \(lastName)"
}

do {
    let fooBar = try fullName(firstName: nil, lastName: nil, calculator: +)
} catch NameErrors.firstNameIsInvalid {
    "Fist name is invalid"
} catch NameErrors.lastNameIsInvalid {
    "Last name is invalid"
} catch let error {
    "Some other error = \(error)"
}

// Results in Error handling
enum IntegerErrors: Error {
    case noPositiveIntegerBefore(thisValue: Int)
}

func getPreviousPositiveInteger(from int: Int) -> Result<Int, IntegerErrors> {
    guard int > 0 else {
        return Result.failure(IntegerErrors.noPositiveIntegerBefore(thisValue: int))
    }
    return Result.success(int - 1)
}

func performGet(forValue value: Int){
    switch getPreviousPositiveInteger(from: value) {
    case let .success(previousValue):
        "Previous values is \(previousValue)"
    case let .failure(error):
        switch error {
        case let .noPositiveIntegerBefore(thisValue):
            "No positive integer before \(thisValue)"
        }
    }
}


performGet(forValue: 0)
performGet(forValue: 2)


