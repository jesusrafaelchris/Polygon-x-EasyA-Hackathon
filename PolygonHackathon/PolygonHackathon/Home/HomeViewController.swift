import UIKit

class HomeViewController: UIViewController {
    
    var tabBar: TabBarController?
    
    var trending: [TrendingNow] = [
        TrendingNow(image: "polygon", title: "Polygon X EasyA", description: "Technology, Hackathon", date: "22 Oct", price: "FREE"),
        TrendingNow(image: "abba", title: "Abba", description: "Music, 70's", date: "28 May", price: "£20-100"),
        TrendingNow(image: "arcticmonkeys", title: "Arctic Monkeys", description: "Music, Indie", date: "16 June", price: "£60-180"),
        TrendingNow(image: "coldplay", title: "Coldplay", description: "Music, Pop", date: "31 May", price: "£70-200"),
    ]
    
    var upcoming: [Upcoming] = [
        Upcoming(image: "polygon", title: "Polygon X EasyA", description: "Technology, Hackathon", date: "22 Oct"),
        Upcoming(image: "taylor", title: "Taylor Swift", description: "Music, Pop, Female", date: "11 Mar"),
        Upcoming(image: "wallows", title: "The Wallows", description: "Music, Indie", date: "24 Apr"),
        Upcoming(image: "edsheeran", title: "Ed Sheeran", description: "Music, Pop", date: "4 Feb"),
    ]
    
    lazy var topBarView: TopBarView = {
        let topBarView = TopBarView()
        return topBarView
    }()
    
    lazy var slider: ForYouMarketPlaceSlider = {
        let slider = ForYouMarketPlaceSlider()
        return slider
    }()
    
    lazy var searchbar: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = .white10
        textfield.attributedPlaceholder = NSAttributedString(
            string: "  Explore Events",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.inactive]
        )
        textfield.layer.cornerRadius = 10
        textfield.layer.masksToBounds = true
        let image = UIImageView(image: UIImage(systemName: "magnifyingglass")?.withTintColor(.inactive).withRenderingMode(.alwaysOriginal))
        textfield.leftView = image
        textfield.leftViewMode = .always
        return textfield
    }()
    
    lazy var trendingNowTitle: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 18, text: "Trending now", bold: true)
        return text
    }()
    
    lazy var trendingNowChevron: UIButton = {
        let trendingNowChevron = UIButton()
        trendingNowChevron.setsizedImage(symbol: "chevron.right", size: 12, colour: .subtitleGray)
        trendingNowChevron.translatesAutoresizingMaskIntoConstraints = false
        return trendingNowChevron
    }()
    
    lazy var upComingTitle: UILabel = {
        let text = UILabel()
        text.layout(colour: .white, size: 18, text: "Upcoming Events", bold: true)
        return text
    }()
    
    lazy var upComingChevron: UIButton = {
        let upComingChevron = UIButton()
        upComingChevron.setsizedImage(symbol: "chevron.right", size: 12, colour: .subtitleGray)
        upComingChevron.translatesAutoresizingMaskIntoConstraints = false
        return upComingChevron
    }()
    
    lazy var exploreCollectionView: UICollectionView = {
        let flowlayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowlayout)
        collectionview.register(EventCell.self, forCellWithReuseIdentifier: "exploreCell")
        collectionview.backgroundColor = .clear
        collectionview.isUserInteractionEnabled = true
        collectionview.delegate = self
        collectionview.dataSource = self
        return collectionview
    }()
    
    lazy var upcomingCollectionView: UICollectionView = {
        let flowlayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        let collectionview = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowlayout)
        collectionview.register(UpcomingCell.self, forCellWithReuseIdentifier: "upcomingCell")
        collectionview.backgroundColor = .clear
        collectionview.isUserInteractionEnabled = true
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.showsHorizontalScrollIndicator = false
        return collectionview
    }()
    
    init(tabBar: TabBarController) {
        self.tabBar = tabBar
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .polygonBlack
        setupView()
    }
    
    func setupView() {
        view.addSubview(topBarView)
        view.addSubview(slider)
        //view.addSubview(searchbar)
        view.addSubview(trendingNowTitle)
        view.addSubview(trendingNowChevron)
        view.addSubview(exploreCollectionView)
        view.addSubview(upComingTitle)
        view.addSubview(upComingChevron)
        view.addSubview(upcomingCollectionView)
        
        //topBarView.profileImage.centerXAnchor
        
        topBarView.anchor(top: view.topAnchor, paddingTop: 70, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 0)
        
        slider.anchor(top: topBarView.bottomAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 0, height: 0)
        
        //searchbar.anchor(top: slider.bottomAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: slider.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 16, width: 0, height: 50)

        trendingNowTitle.anchor(top: slider.bottomAnchor, paddingTop: 30, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: nil, paddingRight: 0, width: 0, height: 0)
        
        trendingNowChevron.centerYAnchor.constraint(equalTo: trendingNowTitle.centerYAnchor).isActive = true
        trendingNowChevron.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        exploreCollectionView.anchor(top: trendingNowTitle.bottomAnchor, paddingTop: 20, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 16, width: 0, height: 250)

        upComingTitle.anchor(top: exploreCollectionView.bottomAnchor, paddingTop: 30, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: nil, paddingRight: 16, width: 0, height: 0)
        
        upComingChevron.centerYAnchor.constraint(equalTo: upComingTitle.centerYAnchor).isActive = true
        upComingChevron.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        upcomingCollectionView.anchor(top: upComingTitle.bottomAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: view.leftAnchor, paddingLeft: 16, right: view.rightAnchor, paddingRight: 0, width: 0, height: 200)

    }
}

// MARK: CollectionView Methods

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == exploreCollectionView {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "exploreCell",
                for: indexPath) as? EventCell else { return UICollectionViewCell() }
            let data = trending[indexPath.item]
            cell.configure(data: data)
            return cell
        }
        else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "upcomingCell",
                for: indexPath) as? UpcomingCell else { return UICollectionViewCell() }
            let data = upcoming[indexPath.item]
            cell.configure(data: data)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == exploreCollectionView {
            let itemWidth = collectionView.bounds.width
            let itemHeight = CGFloat(44)//view.bounds.height / 15
            let itemSize = CGSize(width: itemWidth, height: itemHeight)
            return itemSize
        }
        else {
            let itemSize = CGSize(width: 130, height: 150)
            return itemSize
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == exploreCollectionView {
            return 30
        }
        else {
            return 10
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == exploreCollectionView {
            return 20
        }
        else {
            return 20
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let tabBar = self.tabBar else {return}
        let eventVC = EventViewController(tabBar: tabBar)
        self.navigationController?.pushViewController(eventVC, animated: true)
    }
}


struct TrendingNow {
    var image: String
    var title: String
    var description: String
    var date: String
    var price: String
}

struct Upcoming {
    var image: String
    var title: String
    var description: String
    var date: String
}
