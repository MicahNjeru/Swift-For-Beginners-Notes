import Foundation
import PlaygroundSupport
import _Concurrency

// Asynchronous Programming Setup
PlaygroundPage
    .current
    .needsIndefiniteExecution = true

// Asynchronous Programming: it will not immediately return its result or not return a result
// Asynchronous code only runs in async functions and Tasks
func calculateFullName (firstName: String, lastName: String) async -> String {
    try? await Task.sleep(for: .seconds(1))
    return "\(firstName) \(lastName)"
}

Task {
    let result1 = await calculateFullName(firstName: "Foo", lastName: "Bar")
    async let result2 = calculateFullName(firstName: "Foo", lastName: "Bar")
    await result2
}

enum Clothe {
    case socks, shirt, trousers
}

func buySocks() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.socks
}

func buyShirt() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.shirt
}

func buyTrousers() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.trousers
}

struct Ensemble: CustomDebugStringConvertible {
    let clothes: [Clothe]
    let totalPrice: Double
    
    
    var debugDescription: String {
        "Clothes = \(clothes), price \(totalPrice)"
    }
}

func buyWholeEnsemble() async throws -> Ensemble {
    async let socks = buySocks()
    async let shirt = buyShirt()
    async let trousers = buyTrousers()
    
    let ensemble = Ensemble(clothes: await [try socks, try shirt, try trousers], totalPrice: 200)
    return ensemble
}

Task {
    if let ensemble = try? await buyWholeEnsemble() {
        print(ensemble)
    } else {
        "Something went wrong"
    }
}


