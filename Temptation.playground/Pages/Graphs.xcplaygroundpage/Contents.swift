/*:
 
 # Graph
 
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
import UIKit

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

//: [➡️](@next)