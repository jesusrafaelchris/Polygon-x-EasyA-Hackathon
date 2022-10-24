//
//  CodeVC.swift
//  QRCode
//
//  Created by Artemiy Malyshau on 23/10/2022.
//

import UIKit

class CodeVC: UIViewController {
    
    var hashString: String = ""
    
    lazy var QRText: UILabel = {
        let Text = UILabel()
        Text.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        Text.textColor = .white
        Text.text = hashString
        Text.translatesAutoresizingMaskIntoConstraints = false
        Text.numberOfLines = 0
        return Text
    }()
    
    lazy var Tick: UIImageView = {
        let tick = UIImageView()
        tick.image = UIImage(systemName: "checkmark.circle.fill")?.withTintColor(.white).withRenderingMode(.alwaysOriginal)
        tick.translatesAutoresizingMaskIntoConstraints = false
        return tick
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGreen
        view.addSubview(QRText)
        view.addSubview(Tick)
        
        QRText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        QRText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        QRText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true

        
        Tick.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Tick.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        Tick.heightAnchor.constraint(equalToConstant: 100).isActive = true
        Tick.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
    }

}
