import UIKit

public extension UIImage {
    
    public func makesIt() -> UIImage {
        let imageRect:CGRect = CGRectMake(0, 0, size.width, size.height)
        let colorSpace = CGColorSpaceCreateDeviceGray()
        
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.None.rawValue)
        let context = CGBitmapContextCreate(nil, Int(size.width), Int(size.height), 8, 0, colorSpace, bitmapInfo.rawValue)
        
        CGContextDrawImage(context, imageRect, CGImage)
        let imageRef = CGBitmapContextCreateImage(context)
        let newImage = UIImage(CGImage: imageRef!)
        
        return newImage
    }
    
}