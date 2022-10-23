import UIKit

class TicketsViewController: UIViewController {
    
    var tickets: [Wallet] = [
        Wallet(image: "polygon", title: "Polygon X EasyA", description: "22 Oct"),
        Wallet(image: "abba", title: "Abba", description: "28 May"),
        Wallet(image: "arcticmonkeys", title: "Arctic Monkeys", description: "16 Jun"),
    ]
    
    lazy var ticketsTitle: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 26, text: "My Tickets", bold: true)
        return text
    }()
    
    lazy var myRewardsTitle: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 16, text: "My Rewards", bold: true)
        return text
    }()
    
    lazy var myRewardsView: RewardsView = {
        let view = RewardsView()
        return view
    }()
    
    lazy var walletTitle: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 16, text: "Tickets", bold: true)
        return text
    }()
    
    lazy var walletCollectionView: UICollectionView = {
        let flowlayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowlayout)
        collectionview.register(WalletCell.self, forCellWithReuseIdentifier: "walletCell")
        collectionview.backgroundColor = .clear
        collectionview.isUserInteractionEnabled = true
        collectionview.delegate = self
        collectionview.dataSource = self
        return collectionview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .polygonBlack
        view.addSubview(ticketsTitle)
        view.addSubview(myRewardsTitle)
        view.addSubview(myRewardsView)
        view.addSubview(walletTitle)
        view.addSubview(walletCollectionView)
        
        ticketsTitle.anchor(top: view.topAnchor, paddingTop: 70, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 0)
        
        myRewardsTitle.anchor(top: ticketsTitle.bottomAnchor, paddingTop: 30, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: nil, paddingRight: 16, width: 0, height: 0)
        
        myRewardsView.anchor(top: myRewardsTitle.bottomAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 200)
        
        walletTitle.anchor(top: myRewardsView.bottomAnchor, paddingTop: 30, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: nil, paddingRight: 16, width: 0, height: 0)
        
        walletCollectionView.anchor(top: walletTitle.bottomAnchor, paddingTop: 20, bottom: view.bottomAnchor, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 0)
    }
}

// MARK: CollectionView Methods

extension TicketsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tickets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "walletCell",
            for: indexPath) as? WalletCell else { return UICollectionViewCell() }
        let data = tickets[indexPath.item]
        cell.configure(data: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width
        let itemHeight = CGFloat(44)//view.bounds.height / 15
        let itemSize = CGSize(width: itemWidth, height: itemHeight)
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // to qr code
        let QR = QRCodeViewController()
        navigationController?.present(QR, animated: true)
    }
}

struct Wallet {
    var image: String
    var title: String
    var description: String
}
