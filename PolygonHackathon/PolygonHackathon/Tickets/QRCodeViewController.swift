import UIKit

class QRCodeViewController: UIViewController {
    
    lazy var ticketsTitle: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 26, text: "Polygon X EasyA", bold: true)
        return text
    }()
    
    lazy var calendarView: InfoView = {
        let calendar = InfoView()
        calendar.configure(image: "calendar", text: "Sat, 22 Oct 22:00 -\nSun, 23 Oct, 17:30")
        return calendar
    }()
    
    lazy var locationView: InfoView = {
        let location = InfoView()
        location.configure(image: "map.fill", text: "Kachette, London, UK")
        return location
    }()
    
    lazy var infostackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 24
        stackView.addArrangedSubview(calendarView)
        stackView.addArrangedSubview(locationView)
        return stackView
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 0
        imageView.image = QRCodeGenerator.generateQRCode(from: "0xfe6bec470e13c474fbec1ba6a51c9920aafde6ab3fd674592258d2eacfa91983")
        imageView.translatesAutoresizingMaskIntoConstraints = false 
        return imageView
    }()
    
    lazy var NFTimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "NFT")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nftLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .polygonPurple, size: 20, text: "PolygonXeasyA#075", bold: true)
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        UIScreen.main.brightness = CGFloat(1)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIScreen.main.brightness = CGFloat(0.7)
    }
    
    func setupView() {
        view.backgroundColor = .polygonBlack

        view.addSubview(ticketsTitle)
        view.addSubview(infostackView)
        view.addSubview(imageView)
        view.addSubview(NFTimageView)
        view.addSubview(nftLabel)
        
        ticketsTitle.anchor(top: view.topAnchor, paddingTop: 40, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: nil, paddingRight: 16, width: 0, height: 0)
        
        infostackView.anchor(top: ticketsTitle.bottomAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 0)
        
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        NFTimageView.anchor(top: imageView.bottomAnchor, paddingTop: 30, bottom: nil, paddingBottom: 0, left: imageView.leftAnchor, paddingLeft: 0, right: nil, paddingRight: 16, width: 50, height: 50)
        
        nftLabel.anchor(top: nil, paddingTop: 30, bottom: nil, paddingBottom: 0, left: NFTimageView.rightAnchor, paddingLeft: 16, right: nil, paddingRight: 16, width: 0, height: 0)
        nftLabel.centerYAnchor.constraint(equalTo: NFTimageView.centerYAnchor).isActive = true
    }
}
