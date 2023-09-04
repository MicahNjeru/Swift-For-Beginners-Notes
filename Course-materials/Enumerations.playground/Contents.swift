import Foundation

/// Enumerations are: categorization of similar values that are named. Such as values.

enum Animals {
    case cat
    case dog
    case rabbit
}

let cat = Animals.cat
cat

if cat == Animals.cat {
    "This is a cat"
} else if cat == Animals.dog {
    "This is a dog"
} else if cat == Animals.rabbit {
    "Definitely something else"
}

// Using switch statements
// Switch statements must be exhaustively covered
switch cat {
case .cat:
    "This is a cat"
case .dog:
    "This is a dog"
case .rabbit:
    "This is a rabbit"
}


