import UIKit

class WalletCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "polygon")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 22
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 16, text: "Polygon X EasyA", bold: true)
        return text
    }()
    
    lazy var descriptionLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .inactive, size: 12, text: "Technology, Hackathon", bold: true)
        text.numberOfLines = 0
        return text
    }()
    
    lazy var featuredStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 4
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        return stackView
    }()
    
    lazy var QRButton: UIButton = {
        let button = UIButton()
        button.setsizedImage(symbol: "qrcode.viewfinder", size: 14, colour: .white)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: Wallet) {
        imageView.image = UIImage(named: data.image)
        titleLabel.text = data.title
        descriptionLabel.text = data.description
    }
    
    func setupView() {
        addSubview(imageView)
        addSubview(featuredStackView)
        addSubview(QRButton)
        
        imageView.anchor(top: topAnchor, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: nil, paddingRight: 0, width: 44, height: 44)
        
        featuredStackView.anchor(top: topAnchor, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 0, left: imageView.rightAnchor, paddingLeft: 10, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        QRButton.anchor(top: nil, paddingTop: 0, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 10, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
        QRButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
}
