import UIKit

class RewardsView: UIView {
    
    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 16, text: "Ticket Rewards", bold: true)
        return text
    }()
    
    lazy var descriptionLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 12, text: "Layer 2: 15% discount", bold: false)
        return text
    }()
    
    lazy var nameLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 18, text: "CHRISTIAN GRINLING", bold: true)
        text.setTextSpacingBy(value: 2)
        return text
    }()
    
    lazy var membershipIDLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 12, text: "ID: #9876783920", bold: true)
        return text
    }()
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 4
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        return stackView
    }()
    
    lazy var nameMembershipStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 4
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(membershipIDLabel)
        return stackView
    }()
    
    lazy var infoButton: UIButton = {
        let button = UIButton()
        button.setsizedImage(symbol: "info.circle", size: 14, colour: .white)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(labelStackView)
        addSubview(infoButton)
        addSubview(nameMembershipStackView)
        
        labelStackView.anchor(top: topAnchor, paddingTop: 15, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 15, right: nil, paddingRight: 0, width: 0, height: 0)
        
        infoButton.anchor(top: topAnchor, paddingTop: 15, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: rightAnchor, paddingRight: 15, width: 0, height: 0)
        
        nameMembershipStackView.anchor(top: nil, paddingTop: 15, bottom: bottomAnchor, paddingBottom: 15, left: leftAnchor, paddingLeft: 15, right: nil, paddingRight: 0, width: 0, height: 0)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.colors = [UIColor.purple.cgColor, UIColor.polygonPurple.cgColor]
        l.startPoint = CGPoint(x: 0, y: 0.5)
        l.endPoint = CGPoint(x: 1, y: 0.5)
        l.cornerRadius = 16
        layer.insertSublayer(l, at: 0)
        return l
    }()
}
