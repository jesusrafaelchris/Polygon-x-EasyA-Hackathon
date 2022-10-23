import UIKit

class EventViewController: UIViewController {
    
    var tabBar: TabBarController?
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "polygon")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 24, text: "Polygon X EasyA Hackathon", bold: true)
        text.numberOfLines = 0
        return text
    }()
    
    lazy var descriptionLabel: UILabel = {
        let text = UILabel()
        text.layout(colour: .subtitleGray, size: 14, text:
                    """
                    We’re hyped to have you at the first ever Polygon student hackathon in London! We’ve been working with the Polygon team and we’re excited to say that this is genuinely going to be the best hackathon we’ve ever put on.
                    """
                    , bold: true)
        text.numberOfLines = 0
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
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 8
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        return stackView
    }()
    
    lazy var eventOrganiser: EventOrganiserView = {
        let eventOrganiser = EventOrganiserView()
        eventOrganiser.configure(image: "easya", name: "EasyA", keywords: "Technology, Hackathon")
        return eventOrganiser
    }()
    
    lazy var buyTicketButton: BuyButton = {
        let button = BuyButton()
        button.layout(textcolour: .white, backgroundColour: .clear, size: 18, text: "Buy Ticket", image: nil, cornerRadius: 10)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        let heartbutton = UIBarButtonItem(image: UIImage(systemName: "heart")?.withTintColor(.white).withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(likeEvent))
        
        navigationItem.rightBarButtonItem = heartbutton
        
        let backbutton = UIBarButtonItem(image: UIImage(systemName: "arrow.left")?.withTintColor(.white).withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(goBack))
        navigationItem.leftBarButtonItem = backbutton
        
        buyTicketButton.addTarget(self, action: #selector(buyticket), for: .touchUpInside)
    }
    
    init(tabBar: TabBarController) {
        self.tabBar = tabBar
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.tabBar?.hideMiddleButton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.tabBar?.showMiddleButton()
    }
    
    func setupView() {
        view.backgroundColor = .polygonBlack
        
        view.addSubview(imageView)
        view.addSubview(stackView)
        view.addSubview(infostackView)
        view.addSubview(eventOrganiser)
        view.addSubview(buyTicketButton)
        
        imageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 30, right: view.rightAnchor, paddingRight: 30, width: 0, height: 300)
        
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        stackView.anchor(top: imageView.bottomAnchor, paddingTop: 30, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 30, right: view.rightAnchor, paddingRight: 30, width: 0, height: 0)
        
        infostackView.anchor(top: stackView.bottomAnchor, paddingTop: 30, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 30, right: view.rightAnchor, paddingRight: 30, width: 0, height: 0)
        
        eventOrganiser.anchor(top: nil, paddingTop: 20, bottom: buyTicketButton.topAnchor, paddingBottom: 20, left: view.leftAnchor, paddingLeft: 30, right: view.rightAnchor, paddingRight: 30, width: 0, height: 0)
        
        buyTicketButton.anchor(top: nil, paddingTop: 0,
                        bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 8,
                        left: view.leftAnchor, paddingLeft: 24,
                        right: view.rightAnchor, paddingRight: 24,
                        width: 0, height: 54)
    }
    
    @objc func buyticket() {
        self.showSpinner(onView: view)
        let confirmBuy = ConfirmBuyViewController()
        //getAddress { address in
           // print(address)
            
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.removeSpinner()
            self.navigationController?.present(confirmBuy, animated: true)
        }
       // }
    }
    
    @objc func likeEvent() {
        
    }
    
    @objc func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func getAddress(completion: @escaping (String) -> Void) {
        let url = URL(string: "http://10.2.1.20:3000/url")
        guard let requestUrl = url else { fatalError() }
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }

                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    completion(dataString)
                }
        }
        task.resume()
    }
}
