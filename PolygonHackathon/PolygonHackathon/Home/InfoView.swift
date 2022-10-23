import UIKit

class InfoView: UIView {
    
    public struct Constants {
        static var picturesize = CGFloat(28)
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
        label.layout(colour: .white, size: 12, text: "", bold: true)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var totalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.addArrangedSubview(infoImage)
        stackView.addArrangedSubview(infoTitle)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(image: String, text: String) {
        infoImage.image = UIImage(systemName: image)?.withTintColor(.polygonPurple).withRenderingMode(.alwaysOriginal)
        infoTitle.text = text
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
