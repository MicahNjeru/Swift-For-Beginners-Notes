import Foundation


// Custom Operators
let firstName: String? = "Foo"
let lastName: String? = "Bar"
let fullName = firstName + lastName

// Binary infix operator
func + (lhs: String?, rhs:String?) -> String? {
    switch (lhs, rhs) {
    case (.none, .none):
        return nil
    case let (.some(value), .none):
        return value + " "
    case let (.none, .some(value)):
        return value
    case let (.some(lhs), .some(rhs)):
        return lhs + " " + rhs
    }
}

// Unary prefix operator
prefix operator ^
prefix func ^ (value: String) -> String {
    value.uppercased()
}
let lowerCaseName = "Foo Bar"
let upperCaseName = ^lowerCaseName


// Unary postfix operator
postfix operator *
postfix func *(value: String) -> String {
    "*** \(value) ***"
}

let withStars = lowerCaseName*



