import UIKit

protocol dismissDelegate: NSObject {
    func didDismiss()
}

class ConfirmBuyViewController: UIViewController {
    
    weak var delegate: dismissDelegate?
    
    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 36, text: "Success!", bold: true)
        text.numberOfLines = 0
        return text
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "NFT")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nftLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .polygonPurple, size: 24, text: "PolygonXeasyA#075", bold: true)
        return text
    }()
    
    lazy var descriptionLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .subtitleGray, size: 20, text: "This NFT acts as a ticket for you to enter this event", bold: true)
        text.numberOfLines = 0
        return text
    }()
    
    lazy var featuredStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 4
        stackView.addArrangedSubview(nftLabel)
        stackView.addArrangedSubview(descriptionLabel)
        return stackView
    }()
    
    lazy var ticketButton: BuyButton = {
        let button = BuyButton()
        button.setTitle("Go to Tickets", for: .normal)
        button.addTarget(self, action: #selector(dismissview), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .polygonBlack
        setupView()
    }

    func setupView() {
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(featuredStackView)
        view.addSubview(ticketButton)
        
        titleLabel.anchor(top: view.topAnchor, paddingTop: 60, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 0, height: 0)
        
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        featuredStackView.anchor(top: imageView.bottomAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: imageView.leftAnchor, paddingLeft: 0, right: imageView.rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        ticketButton.anchor(top: featuredStackView.bottomAnchor, paddingTop: 40, bottom: nil, paddingBottom: 60, left: imageView.leftAnchor, paddingLeft: 0, right: imageView.rightAnchor, paddingRight: 0, width: 0, height: 60)
    }
    
    @objc func dismissview() {
        if let delegate = delegate {
            delegate.didDismiss()
            self.dismiss(animated: true)
        }
    }
}
