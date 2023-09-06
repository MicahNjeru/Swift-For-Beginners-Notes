import Foundation


/// Generics: used to avoid writing the same functions/code multiple times
/// Can be used in so many different ways

// Generic Example that works with Ints & Doubles that conform to the "Numeric protocol"
func perform<N: Numeric>(_ op: (N, N) -> N, on lhs: N, and rhs: N) -> N {
    op(lhs, rhs)
}

// Example
perform(*, on: 10, and: 20)
perform(+, on: 10, and: 20)
perform(/, on: 10, and: 20)
let x = perform(-, on: 10, and: 20)

/// Interesting note: using the generic function, we can actually perform operations on Ints & Doubles
/// something that doesn't happen normally as can be tried on the commented code bellow
//let x = 2
//let y = 2.2
//let z = x + y

// Alternative way of creating generic signatures.
func performSecond<N>(_ op: (N, N) -> N, on lhs: N, and rhs: N) -> N where N: Numeric{
    op(lhs, rhs)
}

// Generics can conform to protocols
protocol CanJump {
    func jump()
}

protocol CanRun {
    func run()
}

struct Person: CanJump, CanRun {
    func jump() {
        "Jumping..."
    }
    
    func run() {
        "Running..."
    }
}

// Generic function that takes in jump & run
func jumpAndRun<T: CanJump & CanRun>(_ value: T) {
    value.jump()
    value.run()
}

let person = Person()
person.jump()
person.run()
jumpAndRun(person)
