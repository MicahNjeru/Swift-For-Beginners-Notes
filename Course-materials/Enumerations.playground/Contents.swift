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

/// Advanced Enums: Associated Values
/// Passing values to enum cases
enum Shortcut {
    case fileOrFolder(path: URL, name: String)
    case wwwUrl(path: URL)
    case song(artist: String, songName: String)
}

let wwwApple = Shortcut.wwwUrl(path: URL(string:"https://apple.com")!)

switch wwwApple {
case .fileOrFolder(path: let path, name: let name):
    path
    name
    break
case .wwwUrl(path: let path):
    path
    break
case .song(artist: let artist, songName: let songName):
    artist
    songName
    break
}

// Cleaning up the switch statment
switch wwwApple {
case .fileOrFolder(let path, let name):
    path
    name
    break
case .wwwUrl(let path):
    path
    break
case .song(let artist, let songName):
    artist
    songName
    break
}

// Cleaning up further
switch wwwApple {
case let .fileOrFolder(path, name):
    path
    name
    break
case let .wwwUrl(path):
    path
    break
case let .song(artist, songName):
    artist
    songName
}

// Another compact way of unpacking values using If-statements
if case let .wwwUrl(path) = wwwApple {
    path
}

let withoutYou = Shortcut.song(artist: "Symphony X", songName: "Without you")

if case let .song(_, songName) = withoutYou {
    songName
}

// Further compaction through computed properties
enum Vehicle {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, yearMade: Int)
    
    var manufacturer: String {
        switch self {
        case let .car(manufacturer,_),
        let .bike(manufacturer, _):
            return manufacturer
        }
    }
}

let car = Vehicle.car(manufacturer: "Benz", model: "E63")
let bike = Vehicle.bike(manufacturer: "Ducatti", yearMade: 2025)

car.manufacturer
bike.manufacturer

// Enumerations with raw values
enum FamilyMember: String {
    case father = "Dad"
    case mother = "Mum"
    case brother = "Bro"
    case sister = "Sis"
}

FamilyMember.father.rawValue

// Case iterable
enum FavoriteEmoji: String, CaseIterable {
    case blush = "😊"
    case rocket = "🚀"
    case fire = "🔥"
}

FavoriteEmoji.allCases
FavoriteEmoji.allCases.map(\.rawValue)

if let blush = FavoriteEmoji(rawValue: "😊") {
    "Found the blush emoji"
    blush
} else {
    "This emoji doesn't exist"
}


if let snow = FavoriteEmoji(rawValue: "❄️") {
    "Snow exists?! Really?"
    snow
} else {
    "As expected, snow doesn't exist in our enum "
}

// Mutating Functions inside enums
enum Height {
    case short, medium, long
    mutating func makeLong() {
        self = Height.long
    }
}

var myHeight = Height.medium
myHeight.makeLong()
myHeight

// Recursive enumerations
indirect enum IntOperation {
    case add(Int, Int)
    case subtract(Int, Int)
    case freeHand(IntOperation)
    
    func calculateResult(of operation: IntOperation? = nil) -> Int {
        switch operation ?? self {
        case let .add(lhs, rhs):
            return lhs + rhs
        case let .subtract(lhs, rhs):
            return lhs - rhs
        case let .freeHand(operation):
            return calculateResult(of: operation)
        }
    }
}

let freeHand = IntOperation.freeHand(.add(2, 4))
freeHand.calculateResult()
