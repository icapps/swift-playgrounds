/*:
 
 # Optionals
 
 Let's start with something new and cool that we as Objective-C developers never experienced before: **optionals**.
 
 Let's first start by settings up the `Person` protocol and create 2 people. Marvin and Louise, and let's pretend they are a couple.
 
 */
protocol Person {
    var name: String { get }
}

struct Louise: Person {
    let name = "Louise"
}

struct Marvin: Person {
    let name = "Marvin"
    
    var girlfriend: Person?
    
    init(girlfriend: Person) {
        self.girlfriend = girlfriend
    }
}

var louise = Louise()
var marvin = Marvin(girlfriend: louise)
/*:
 
 Here is a small example on how to read the data. And how the optional values behave.
 
 We'll start by printing the name of Marvin's girlfriend. Here we see how we unwrap the optional values.
 
 */

/*:
 
 But image that Marvin did something wrong (👉🏼👌🏼)... And all of a sudden they split up.
 
 How will we handle the nillified girlfriend?
 
 */

/*:
 
 After some unwrapping it can happen that your indentation gets out of control. Well there is a fix for that. We use the guard keyword.
 
 */
func whoIsMarvinsGirlfriend() {
    if let name = marvin.girlfriend?.name {
        print("Marvin's girlfriend's name is \(name)")
    } else {
        print("Marvin is single again.")
    }
}
whoIsMarvinsGirlfriend()
//: [➡️](@next)
