#!/usr/bin/swift

// We have a protocol for a person so we can easily check
// for the name without having to subclass from another
// class.
protocol Person {
    var name: String { get }
}





// This is the real victim of Temptation Island, Louise is
// a person _apparently_.
struct Louise: Person {
    let name: String = "Louise"
}





// This is t
struct Single: Person {
    var name: String
}





// This guy. Teh Marvinizer. Also a person, but with some extra
// options. Like a girlfriend (for now), and some skanks.
struct Marvin: Person {
    let name: String = "Marvin"
    
    // This variable can be read from the outside, but only set from
    // inside this class.
    private(set) var girlfriend: Person?
    
    // Can not be accessed from the outside.
    private var skanks: [Person]
    
    // Initialize the Marvin and star off with a girlfriend.
    init(girlfriend: Person?) {
        self.girlfriend = girlfriend
        self.skanks = [Person]()
    }
    
    // Let's inject marvin into a single.
    mutating func inject(intoSingle single: Person) {
        self.girlfriend = nil
        self.skanks.append(single)
    }
    
    func flurts() -> String {
        return skanks.flatMap { $0.name }.joined(separator: ", ")
    }
}





// Starting the Temptation challenge.
// Let's see how Marvin handles his business.
let louise = Louise()
var marvin = Marvin(girlfriend: louise)

let arguments = Process.arguments
for name in arguments[1..<arguments.count] {
    let single = Single(name: name)
    marvin.inject(intoSingle: single)
}

if let girlfriend = marvin.girlfriend {
    print("Marvin has a girlfriend named '\(girlfriend.name)'")
} else {
    print("Ladies, Marvin is back!")
    print("The Marvinizer had a great time with \(marvin.flurts())!")
}
