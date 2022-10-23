import UIKit

class EventOrganiserView: UIView {
    
    public struct Constants {
        static var picturesize = CGFloat(40)
    }
    
    lazy var infoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = Constants.picturesize / 2
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var infoTitle: UILabel = {
        let label = UILabel()
        label.layout(colour: .white, size: 18, text: "", bold: true)
        return label
    }()
    
    lazy var infoDescription: UILabel = {
        let label = UILabel()
        label.layout(colour: .subtitleGray, size: 12, text: "", bold: false)
        return label
    }()
    
    lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 2
        stackView.alignment = .leading
        stackView.addArrangedSubview(infoTitle)
        stackView.addArrangedSubview(infoDescription)
        return stackView
    }()
    
    lazy var totalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.addArrangedSubview(infoImage)
        stackView.addArrangedSubview(infoStackView)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(image: String, name: String, keywords: String) {
        infoImage.image = UIImage(named: image)
        infoTitle.text = name
        infoDescription.text = keywords
    }
    
    func setupView() {
        addSubview(totalStackView)
        
        totalStackView.anchor(top: topAnchor, paddingTop: 0,
                              bottom: bottomAnchor, paddingBottom: 0,
                              left: leftAnchor, paddingLeft: 0,
                              right: rightAnchor, paddingRight: 0,
                              width: 0, height: 0)
        
        infoImage.heightAnchor.constraint(equalToConstant: Constants.picturesize).isActive = true
        infoImage.widthAnchor.constraint(equalToConstant: Constants.picturesize).isActive = true
    }
}
