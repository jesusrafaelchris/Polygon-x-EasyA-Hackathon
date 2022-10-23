import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    let middleButton = MiddleButton()
        
    // View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        // remove top line
        tabBar.tintColor = .polygonPurple
        if #available(iOS 13.0, *) {
            // ios 13.0 and above
            let appearance = tabBar.standardAppearance
            appearance.shadowImage = nil
            appearance.shadowColor = nil
            appearance.backgroundEffect = nil
            // need to set background because it is black in standardAppearance
            appearance.backgroundColor = .white
            tabBar.standardAppearance = appearance

        } else {
            // below ios 13.0
            let image = UIImage()
            tabBar.shadowImage = image
            tabBar.backgroundImage = image
            // background
            tabBar.backgroundColor = .white
        }
}

// Tab Bar Specific Code
override func viewDidAppear(_ animated: Bool) {
    
    let home = HomeViewController(tabBar: self)
    let homeimage = UIImage(systemName: "house")
    let homeselected = UIImage(systemName: "house.fill")
    home.tabBarItem =  UITabBarItem(title: "", image: homeimage, selectedImage: homeselected)
   
    // need to move this to custom button
    let tickets = TicketsViewController()
    let ticketImage = UIImage(systemName: "wallet.pass")
    let ticketselected = UIImage(systemName: "wallet.pass.fill")
    tickets.tabBarItem = UITabBarItem(title: "", image: ticketImage, selectedImage: ticketselected)

    let account = AccountViewController()
    let accountimage = UIImage(systemName: "person.crop.circle")
    let accountselected = UIImage(systemName: "person.crop.circle.fill")
    account.tabBarItem = UITabBarItem(title: "", image: accountimage, selectedImage: accountselected)

    let tabbarList = [home, tickets, account]
    
    viewControllers = tabbarList.map {
        UINavigationController(rootViewController: $0)
    }
    self.setupMiddleButton()
}
    
    func hideMiddleButton() {
        self.middleButton.isHidden = true
    }
    
    func showMiddleButton() {
        self.middleButton.isHidden = false
    }

// TabBarButton – Setup Middle Button
func setupMiddleButton() {
    
    middleButton.setImage(UIImage(systemName: "wallet.pass")?.withTintColor(.white).withRenderingMode(.alwaysOriginal), for: .normal)
    middleButton.layer.cornerRadius = 25
    middleButton.layer.masksToBounds = true
    
    self.view.addSubview(middleButton)
    
    middleButton.anchor(top: tabBar.topAnchor, paddingTop: -16, bottom: nil, paddingBottom: 0, left: nil, paddingLeft: 0, right: nil, paddingRight: 0, width: 50, height: 50)
    middleButton.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor).isActive = true

    middleButton.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)

    self.view.layoutIfNeeded()
}

// Menu Button Touch Action
    @objc func menuButtonAction(sender: UIButton) {
    self.selectedIndex = 1
        sender.setImage(UIImage(systemName: "wallet.pass.fill")?.withTintColor(.white).withRenderingMode(.alwaysOriginal), for: .highlighted)
   }
    
 }
