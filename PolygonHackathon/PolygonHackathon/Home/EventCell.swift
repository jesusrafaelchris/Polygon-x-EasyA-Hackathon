import UIKit

class EventCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "polygon")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 22
        return imageView
    }()
    
    lazy var dateLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .polygonPurple, size: 12, text: "Oct 22", bold: true)
        return text
    }()
    
    lazy var priceLabel: UIButton = {
        let button = UIButton()
        button.layout(textcolour: .white, backgroundColour: .white.withAlphaComponent(0.1), size: 12, text: "£20-100", image: nil, cornerRadius: 5)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 16, text: "Polygon X EasyA", bold: true)
        return text
    }()
    
    lazy var descriptionLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .inactive, size: 12, text:
                    "Technology, Hackathon"
                    , bold: true)
        text.numberOfLines = 0
        return text
    }()
    
    lazy var featuredStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 4
        //stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        return stackView
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setsizedImage(symbol: "heart", size: 10, colour: .white)
        return button
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setsizedImage(symbol: "square.and.arrow.up", size: 10, colour: .white)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: TrendingNow) {
        imageView.image = UIImage(named: data.image)
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        dateLabel.text = data.date
        priceLabel.setTitle(data.price, for: .normal)
    }
    
    func setupView() {
        addSubview(imageView)
        addSubview(featuredStackView)
        addSubview(dateLabel)
        addSubview(priceLabel)
        
        imageView.anchor(top: topAnchor, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: nil, paddingRight: 0, width: 44, height: 44)
        
        featuredStackView.anchor(top: topAnchor, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 0, left: imageView.rightAnchor, paddingLeft: 10, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        dateLabel.anchor(top: topAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 10, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        priceLabel.anchor(top: dateLabel.bottomAnchor, paddingTop: 5, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 10, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
        
    }
}
