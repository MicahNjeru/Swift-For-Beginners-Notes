import Foundation

// There are two ways of storing variables
// Using the "let" keyword and "var" keyword
/// The only thing different between these two is that,
/// the "let" variable cannot be assigned to again whereas
/// the "var" variable can be assigned to again.
///

// Constants
let myName = "Micah"
let yourName = "Vandad"

// Variables
var names = [
    myName,
    yourName
]

// Adding to the array
names.append("Bar")
names.append("Foo")
