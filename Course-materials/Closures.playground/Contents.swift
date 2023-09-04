import Foundation


// Closures are special types of functions that are passed in-line

// Example 1: A closure assigned to a variable
let add: (Int, Int) -> Int = { (lhs: Int, rhs: Int) -> Int in
    lhs + rhs
}

add(20, 30)


// Example 2: A closure within a function.
func customAdd(_ lhs: Int, _ rhs: Int, using function: (Int, Int) -> Int) -> Int {
    function(lhs, rhs)
}

/// Explanation 1: In the the code below, the closure within the function was declared as the last argument
/// which makes the closure a trailing closure. One way of satisfying this argument is to use Swift's autocomplete which removes the complex
/// statement provided the closure's arguments are provided and it's return with their respective data types.

customAdd(20, 30, using: { (lhs: Int, rhs: Int) -> Int in
    lhs + rhs
    }
)

/// Explanation 2: In the code below, we further simplify the function's closure by removing it from within the function call's passed in arguments
/// and write it at the end of the function call directly in-line. This is posisble because the closure was written as a trailing closure.

customAdd(20, 30) { (lhs: Int, rhs: Int) -> Int in
    lhs + rhs
}

/// Explanation 3: We can further "clean" and/or simplify the trailing closure by removing the data types in the closure syntax since it was already
/// declared in it's definition. When the code base increases, it wouldn't be advisable to "clean" this further because it'll force the compiler to
/// figure out the data type from the closure definition which will increase compute time.

customAdd(30, 30) { (lhs, rhs) -> Int in
    lhs + rhs
}


