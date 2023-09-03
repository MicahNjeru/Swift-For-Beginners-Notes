import Foundation

/// Functions - blocks of code that can take in a value, compute and could return a result
///  This is the building block of functional programming

func noArgumentsAndNoReturnValue () {
    print("I don't know what I'm doing...as of now")
}

noArgumentsAndNoReturnValue()

// Func that takes in a value
// Swift requires the argument data type to be explicitly declared
func plusTwo(value: Int) {
    let newValue = value + 2
}

plusTwo(value: 30)

// A function that takes in an argument and returns a value
// Swift requires the return value type to be explicitly declared
func newPlusTwo(value: Int) -> Int {
    value + 2
}

newPlusTwo(value: 30)

// A function with more than 1 argument and a return statement
func customAdd(value1: Int, value2: Int) -> Int {
    value1 + value2
}

let customAdded = customAdd(value1: 10, value2: 20)


// A function can have a non-labeled internal/external argument
// Func without external argument labels
func customMinus (_ lhs: Int, _ rhs: Int) -> Int {
    lhs - rhs
}

let customSubtracted = customMinus(20, 10)


/// A discardable result function. The return value of such functions can be ignored by the compiler and not
/// forced to be consumed.
@discardableResult
func myCustomAdd (_ lhs: Int, _ rhs: Int) -> Int {
    lhs + rhs
}

myCustomAdd(20, 30)


// Nested functions
func doSomethingComplicated(with value: Int) -> Int {
    func mainLogic(value: Int) -> Int {
        value + 2
    }
    return mainLogic(value: value + 3)
}

doSomethingComplicated(with: 30)

// Functions with default argument values
func getFullName(firstName: String = "Foo", lastName: String = "Bar") -> String {
    "\(firstName) \(lastName)"
}

/// Various ways to use such functions.
/// You can pass no argument, pass one argument or pass both
getFullName()
getFullName(firstName: "Micah")
getFullName(lastName: "Njeru")
getFullName(firstName: "Micah", lastName: "Njeru")


