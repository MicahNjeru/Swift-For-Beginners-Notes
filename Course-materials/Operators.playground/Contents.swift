import Foundation

var myAge = 25
var yourAge = 22

// Comparison Operators
if myAge > yourAge {
    "I'm older than you"
} else if myAge < yourAge {
    "I'm younger than you"
} else {
    "Oh hey, we're the same age!"
}

// Arithmetic Operators
let myMothersAge = myAge + 20
let doubleMyAge = myAge * 2

/// 1. Unary prefix - working with 1 value and is placed before the value. Eg: "!" (that negates)
let foo = !true

/// 2. Unary postfix - works with 1 value and comes after the value. Eg: "!" (that force unwraps optionals)
let name = Optional("Micah")
type(of: name)
let unaryPostFix = name!
type(of: unaryPostFix)

/// 3. Binary infix - working with 2 values & sits in bewtween 2 other values. Eg: *, +, /
let result = 1 + 2
let names = "Foo" + " " + "Bar"

/// 4. Ternary operator - works with variables after evaluating a conditional statement. Eg:
let age = 30

//let message: String
//if age >= 18 {
//    message = "You're an adult"
//} else {
//    message = "You're not yet an adult"
//}
let message = age >= 18 ? "You are an adult" : "You're not yet an adult"
