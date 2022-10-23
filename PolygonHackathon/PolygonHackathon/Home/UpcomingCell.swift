import UIKit

class UpcomingCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "polygon")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    lazy var dateLabel: UIButton = {
        let button = UIButton()
        button.layout(textcolour: .black, backgroundColour: .white.withAlphaComponent(0.5), size: 12, text: "Sat, Oct 22", image: nil, cornerRadius: 5)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 14, text: "Polygon X EasyA", bold: false)
        return text
    }()
    
    lazy var desciptionLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .polygonPurple, size: 12, text: "FREE - Register Now", bold: true)
        return text
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: Upcoming) {
        imageView.image = UIImage(named: data.image)
        titleLabel.text = data.title
        desciptionLabel.text = data.description
        dateLabel.setTitle(data.date, for: .normal)
    }
    
    func setupView() {
        addSubview(imageView)
        imageView.addSubview(dateLabel)
        addSubview(titleLabel)
        addSubview(desciptionLabel)
        
        imageView.anchor(top: topAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 130)
        
        dateLabel.anchor(top: topAnchor, paddingTop: 10, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: rightAnchor, paddingRight: 10, width: 0, height: 0)
        
        titleLabel.anchor(top: imageView.bottomAnchor, paddingTop: 10, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        
        desciptionLabel.anchor(top: titleLabel.bottomAnchor, paddingTop: 4, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
    }
}
