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

// Using specific errors from the struct
do {
    let fullName = try foo.getFullName()
    fullName
} catch is Person.Errors {
    "Got an error"
}

// How to catch specific errors without know which error it is
let bar = Person(firstName: nil, lastName: nil)

do {
    let fullName = bar.getFullName()
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


