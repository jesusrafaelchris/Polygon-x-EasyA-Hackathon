import UIKit

//Colors
extension UIColor {
    
    public class var polygonBlack: UIColor {
        return UIColor(named: "PolygonBlack")!
    }
    
    public class var polygonPurple: UIColor {
        return UIColor(named: "PolygonPurple")!
    }
    
    public class var polygonPink: UIColor {
        return UIColor(named: "PolygonPink")!
    }
    
    public class var inactive: UIColor {
        return UIColor(named: "Inactive")!
    }
    
    public class var white10: UIColor {
        return .white.withAlphaComponent(0.1)
    }
    
    public class var subtitleGray: UIColor {
        return UIColor(named: "PolygonDescription")!
    }
}
//UIView
extension UIView {
    
    func pinEdgesToSuperView() {
        guard let superView = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: superView.leftAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        rightAnchor.constraint(equalTo: superView.rightAnchor).isActive = true
    }
    
    // swiftlint:disable function_parameter_count
    func anchor(top: NSLayoutYAxisAnchor?, paddingTop: CGFloat, bottom: NSLayoutYAxisAnchor?, paddingBottom: CGFloat, left: NSLayoutXAxisAnchor?, paddingLeft: CGFloat, right: NSLayoutXAxisAnchor?, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
    translatesAutoresizingMaskIntoConstraints = false
        
    if let top = top {
    topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
    if let bottom = bottom {
    bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
    if let right = right {
    rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
    if let left = left {
    leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
    if width != 0 {
    widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
    if height != 0 {
    heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}

// Extension for laying out UILabel
extension UILabel {
    
    func layout(colour: UIColor, size: CGFloat, text: String, bold: Bool) {
        self.text = text
        self.textColor = colour
        if bold == true {
            self.font = UIFont.boldSystemFont(ofSize: size)
        } else {
            self.font = UIFont.systemFont(ofSize: size)
        }
    }
    
    func setTextSpacingBy(value: Double) {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: value, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}

// Extension for laying out UIButton
extension UIButton {
    func layout(textcolour: UIColor?, backgroundColour: UIColor?, size: CGFloat?, text: String?, image: UIImage?, cornerRadius: CGFloat?) {
        setTitle(text, for: .normal)
        setTitleColor(textcolour, for: .normal)
        if let size = size {
            titleLabel?.font = UIFont.boldSystemFont(ofSize: size)
        }

        setImage(image, for: .normal)
        if let radius = cornerRadius {
        layer.cornerRadius = radius
        }
        layer.masksToBounds = true
        backgroundColor = backgroundColour

    }
    
    func setsizedImage(symbol: String, size: CGFloat, colour: UIColor) {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: size, weight: .bold, scale: .large)
        let largeBoldDoc = UIImage(systemName: symbol, withConfiguration: largeConfig)?.withTintColor(colour).withRenderingMode(.alwaysOriginal)
        self.setImage(largeBoldDoc, for: .normal)
    }
}

extension UIView {

    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }


    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
}

var vSpinner : UIView?
extension UIViewController {
    
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = .black.withAlphaComponent(0.5)
        let ai = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        ai.color = .polygonPurple
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
