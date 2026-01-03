import UIKit

let Colors: [UIColor] = [
    .white,
    .black,
    UIColor(hex: "#8c03fc")!,
    UIColor(hex: "#0377fc")!,
    UIColor(hex: "#03fc49")!,
    UIColor(hex: "#dba912")!,
    UIColor(hex: "#fca103")!,
    UIColor(hex: "#db235a")!,
    UIColor(hex: "#d60b6d")!,
    
    .red,
    UIColor(hex: "#f08da3")!,
    UIColor(hex: "#f7d5dc")!,
    UIColor(hex: "#f7f7d5")!,
    UIColor(hex: "#edd280")!,
    UIColor(hex: "#e09b24")!,
    UIColor(hex: "#855709")!,
    UIColor(hex: "#2b1d03")!,
    UIColor(hex: "#206906")!,
    
    UIColor(hex: "#323332")!,
    UIColor(hex: "#2e2e2d")!,
    UIColor(hex: "#424242")!,
    UIColor(hex: "#585958")!,
    UIColor(hex: "#6f706f")!,
    UIColor(hex: "#8b8c8b")!,
    UIColor(hex: "#a2a3a2")!,
    UIColor(hex: "#c5c7c5")!,
    UIColor(hex: "#e6e8e6")!
]

extension UIColor {
    private func clamp(_ value: CGFloat) -> CGFloat {
        min( 1, max(0, value))
    }
    
    func instagramComposerBackground() -> UIColor {
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        
        let alpha: CGFloat = 1
        
        // White / Near white
        if b > 0.92 && s < 0.05 {
            return UIColor(white: 0.05, alpha: alpha)
        }
        
        // Black / Near black {
        if b < 0.08 {
            return UIColor(white: 0.95, alpha: alpha)
        }
        
        // Grayscale
        if s < 0.08 {
            let newBrightness: CGFloat
            if b < 0.5 {
                // dark gray
                newBrightness = clamp(pow(b, 0.55))
            } else {
                // light gray
                newBrightness = clamp(pow(b, 2.1))
            }
            
            return UIColor(white: newBrightness, alpha: alpha)
        }
        
        // Color
        let isStrongColor = s >= 0.6
        
        if isStrongColor {
            // Color đậm
            let newBrightness = clamp(pow(b, 0.3))
            
            return UIColor(hue: h, saturation: 0.35, brightness: newBrightness, alpha: alpha)
        }
        
        // Color nhạt
        return UIColor(hue: h, saturation: clamp(s * 2), brightness: 0.3, alpha: 1)
    }
    
    convenience init?(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexString = hexString.replacingOccurrences(of: "#", with: "")

        var hexNumber: UInt64 = 0
        guard Scanner(string: hexString).scanHexInt64(&hexNumber) else {
            return nil
        }

        let r, g, b, a: CGFloat

        switch hexString.count {
        case 6: // RRGGBB
            r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255
            g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255
            b = CGFloat(hexNumber & 0x0000FF) / 255
            a = 1.0

        case 8: // RRGGBBAA
            r = CGFloat((hexNumber & 0xFF000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000FF) / 255

        default:
            return nil
        }

        self.init(red: r, green: g, blue: b, alpha: a)
    }
}
