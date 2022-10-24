import UIKit

class WhiteAndPurpleTextLabel: UILabel {
    
    func setSizeAndStringAndPurple(text: String, purpleWord: String, size: CGFloat) -> WhiteAndPurpleTextLabel {
        let label = WhiteAndPurpleTextLabel()
        label.layout(colour: .white, size: size, text: text, bold: true)
        label.numberOfLines = 0
        label.attributedText = makeWordPurple(str: text, word: purpleWord, size: size)
        return label
    }

    func makeWordPurple(str: String, word: String, size: CGFloat) -> NSMutableAttributedString {
        guard let range = str.range(of: word) else {
            return NSMutableAttributedString(string: str,
                                             attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: size)])
        }
        let lower = range.lowerBound.utf16Offset(in: str)
        let upper = range.upperBound.utf16Offset(in: str)
        
        let myMutableString = NSMutableAttributedString(string: str,
                                                        attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: size)])
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor,
                                     value: UIColor.polygonPurple,
                                     range: NSRange(location: lower, length: upper - lower))
        return myMutableString
    }
}
