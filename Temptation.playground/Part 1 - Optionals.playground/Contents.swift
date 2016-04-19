
/*:
 
 # Swift Island
 
 Welcome to this wonderfull playground full of temptations.
 
 We'll not really, but it will definitely make you want to do more Swift development.
 
 ## Optionals
 
 Let's start with something new and cool that we as Objective-C developers never experienced before: **optionals**.
 
 Here is a small example on how to use optionals:
 
 */
protocol Person {
    var name: String { get }
}

struct Louise: Person {
    // The name can't change.
    let name = "Louise"
}

struct Marvin: Person {
    // The name can't change.
    let name = "Marvin"
    
    // The girlfriend you start with, isn't the one you 
    // may end up with.
    var girlfriend: Person?
    
    init(girlfriend: Person) {
        self.girlfriend = girlfriend
    }
}

var louise = Louise()
var marvin = Marvin(girlfriend: louise)







marvin.girlfriend
marvin.girlfriend?.name
if let name = marvin.girlfriend?.name {
    print("Marvin's girlfriend's name is \(name)")
}

marvin.girlfriend = nil
marvin.girlfriend
marvin.girlfriend?.name

if let name = marvin.girlfriend?.name {
    print("Marvin's girlfriend's name is \(name)")
}

func marvinize() {
    guard let name = marvin.girlfriend?.name else {
        print("Marvin is single again.")
        return
    }
    
    print("Marvin's girlfriend's name is \(name)")
}
marvinize()





/*:
 
 ## Resources
 
 You can add resources to your storyboard. 
 
 Just tap the keyboard combination **CMD-0** in order to show the navigator. Here you see a resource folder. You can put all the resources (images, data, ...) in here and use them from your code.
 
 */
import UIKit

let faker = UIImage(named: "Faker.jpg")!





/*:
 
 ### Import code
 
 But you can also use external code. In the same navigation (check the ⬅️ panel) you can add source files. These files wel be imported into the playground as a module.
 
 Make sure the classes and methods are that you want to use in this playground are _public_.
 
 */
faker.makesIt()





/*:
 
 ### Add a label
 
 Now what if you want to add a simple `UILabel` to this view. Well you can.
 
 You can just use UIKit views inside the playgrounds and play around with them untill you are happy with the result.
 
 */
let fakerImageView = UIImageView(image: faker)

let label = UILabel(frame: CGRect(x: 0, y: 0, width: faker.size.width, height: faker.size.height))
label.text = "Fake it till you make it!"
label.textAlignment = .Center
label.textColor = UIColor.whiteColor()
label.font = UIFont.systemFontOfSize(30.0, weight: UIFontWeightThin)
label.transform = CGAffineTransformMakeScale(0.7, 0.7)
fakerImageView.addSubview(label)





/*:
 ### Animate
 
 And as an little extra, you can animate the views.
 */
import XCPlayground

XCPlaygroundPage.currentPage.liveView = fakerImageView

UIView.animateWithDuration(0.35, delay: 1.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.6, options: .CurveEaseInOut, animations: {
    label.transform = CGAffineTransformIdentity
}, completion: nil)



/*:
 
 ## Graph
 
 You can show the value of a variable that changes over time. For example when you create a simple **for-loop** where you update the value of a variable.
 
 */
var j = 2
for i in 0 ..< 5 {
    j += j * i
}





/*:
 
 ### Import data
 
 You can now load some JSON data from a resource file.
 
 In this case we will fetch the weather predictions for a special place somewhere in Thailand.
 
 */
let forecasts: [[String: AnyObject]] = {
    let fileURL = NSBundle.mainBundle().URLForResource("weather", withExtension: "json")!
    if let
        data = NSData(contentsOfURL: fileURL),
        json = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments),
        forecasts = json["hourly_forecast"] as? [[String: AnyObject]] {
        return forecasts
    }
    
    return []
}()

var temperature = 0
for forecast in forecasts {
    if let tempString = forecast["temp"]?["english"] as? String {
        temperature = Int(tempString)!
    }
}





/*:
 
 ## Asynchronous call
 
 We can fetch some data from a webservice. In this case we are fetching an image from the interwebs.
 
 */

let url = NSURL(string: "http://www.p-magazine.be/sites/default/files/styles/640x360/public/originals/article/2016-01-22/dit-zijn-de-vrijgezellen-uit-de-temptation-island-teaser.jpg?itok=I-R9BO1M")!
let task = NSURLSession.sharedSession().dataTaskWithURL(url) { data, response, error in
    if let data = data {
        let image = UIImage(data: data)
    }
}
task.resume()
