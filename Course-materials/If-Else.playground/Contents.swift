import Foundation


let myName = "Micah"
let myAge = 25
let yourName = "Vandad"
let yourAge = 20

// If-Else
if myName == "micah" {
    "Your name is \(myName)"
} else {
    "Opps, I guessed it wrong"
}

// If-Else-Else if
if myName == "Micah" {
    "Now I guessed it correctly"
} else if myName == "Foo" {
    "Are you Foo?"
} else {
    "Okay, I give up"
}

// Compounded "and" If-Else-Else if conditional
if myName == "Micah" && myAge == 25{
    "Name is Micah & age is 25"
} else if myAge == 25 {
    "I only guessed the age right"
} else {
    "I don't know what I'm doing"
}

// Compounded "or" If-Else if conditional
if myAge == 25 || myName == "Foo" {
    "Either age is 20, name is Foo or both"
} else if myAge == 30 || myName == "Micah" {
    "It's too late to get in this clause"
}


