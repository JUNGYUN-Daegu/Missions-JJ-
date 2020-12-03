//
//  ViewController.swift
//  201130_week5_FinalProject
//
//  Created by 조중윤 on 2020/11/30.
//

import UIKit

class ViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    let snowEmitter = SnowEmitter()
    let snowIcon = UIImage(systemName: "snow")
    var starIcon = UIImage(named: "star")
    let foodItems = ["치킨","스시","피자","햄버거","떡볶이","케이크"]
    
    let jsonDecoder = JSONDecoder()
    //MARK: - UI Properties
    let foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "snow")
        return imageView
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "testTitle"
        label.backgroundColor = UIColor.hexString2UIColor(hexString: "#dbf6e9")
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "testAddress"
        label.backgroundColor = UIColor.hexString2UIColor(hexString: "#dbf6e9")
        return label
    }()
    
    let menuLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont(name: "Nerko One", size: 100)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "test"
        return label
    }()
    
    let menuSelectBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.hexString2UIColor(hexString: "#ffdada")
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitle("SELECT", for: .normal)
        return button
    }()
    
    let backBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.hexString2UIColor(hexString: "#ffdada")
        button.setTitle("BACK", for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        //FIXME:- how to set text color of button?
        return button
    }()
    //MARK:- View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hexString2UIColor(hexString: "#31326f")
        
        view.addSubview(foodImageView)
        foodImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        foodImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.2).isActive = true
        foodImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        foodImageView.heightAnchor.constraint(equalTo: foodImageView.widthAnchor, multiplier: 1).isActive = true
        foodImageView.isHidden = true
        
        
        view.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: foodImageView.bottomAnchor, constant: 10).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        titleLabel.layer.cornerRadius = view.frame.height / 30
        titleLabel.isHidden = true
        
        view.addSubview(addressLabel)
        addressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addressLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        addressLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        addressLabel.layer.cornerRadius = view.frame.height / 30
        addressLabel.isHidden = true
    
        view.addSubview(menuLabel)
        menuLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        menuLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        menuLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        menuLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        menuLabel.isHidden = true
        
        view.addSubview(menuSelectBtn)
        menuSelectBtn.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -10).isActive = true
        menuSelectBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        menuSelectBtn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        menuSelectBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35).isActive = true
        menuSelectBtn.titleLabel?.font = UIFont(name: "Nerko One", size: view.frame.height / 20)
        menuSelectBtn.addTarget(self, action: #selector(menuSelectBtnPressed), for: .touchUpInside)

        view.addSubview(backBtn)
        backBtn.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 10).isActive = true
        backBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        backBtn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        backBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35).isActive = true
        backBtn.titleLabel?.font = UIFont(name: "Nerko One", size: view.frame.height / 20)
        backBtn.addTarget(self, action: #selector(backBtnPressed), for: .touchUpInside)
       
        setupSnowEmitter(snowIcon: snowIcon!, starIcon: starIcon!)
    
    }
    
    func setupSnowEmitter(snowIcon: UIImage, starIcon: UIImage) {
        let emitterLayer = snowEmitter.get(icon1: snowIcon, icon2: starIcon)
        // setting the center of emitter
        emitterLayer.emitterPosition = CGPoint(x: view.frame.width/2, y: 0)
        // setting the size of emitter
        emitterLayer.emitterSize = CGSize(width: view.frame.width, height: 1)
        view.layer.addSublayer(emitterLayer)
    }
    
    @objc func menuSelectBtnPressed() {
        snowEmitter.emitter.transform = CATransform3DMakeScale(1.2, 1.2, 1.0)
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { (_) in
            self.snowEmitter.emitter.removeFromSuperlayer()
            self.snowEmitter.emitter.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
        }
        
        let randomFood: String = foodItems.randomElement()!
        menuLabel.text = randomFood
        requestAPI(foodName: randomFood)
        menuLabel.isHidden = false
        titleLabel.isHidden = false
        addressLabel.isHidden = false
        if randomFood == "치킨" {
            self.starIcon = UIImage(named: "fried-chicken")
            //["치킨","스시","피자","햄버거","떡볶이","케이크"]
        } else if randomFood == "스시" {
            self.starIcon = UIImage(named: "sushi")
        } else if randomFood == "피자" {
            self.starIcon = UIImage(named: "pizza")
        } else if randomFood == "햄버거" {
            self.starIcon = UIImage(named: "hamburger")
        } else if randomFood == "떡볶이" {
            self.starIcon = UIImage(named: "bokki")
        } else if randomFood == "케이크" {
            self.starIcon = UIImage(named: "cake")
        } else {
            self.starIcon = UIImage(named: "star")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.setupSnowEmitter(snowIcon: self.snowIcon!, starIcon: self.starIcon!)
        }
    }
    
    @objc func backBtnPressed() {
        dismiss(animated: true)
    }
    
//MARK:- API Functions
    func urlTaskDone() {
            let item = dataManager.shared.searchResult?.items[0]
            do {
                OperationQueue.main.addOperation {
                    self.titleLabel.text = item?.title
                    self.addressLabel.text = item?.roadAddress
                }
            }
    }
    
    func requestAPI(foodName: String) {
        let clientID: String = "TC3tZ9qQKlekEg6UHgxl"
        let clientKey: String = "79lA49Ja5y"
        let query = "https://openapi.naver.com/v1/search/local.json?query=\(foodName)&display=10&start=1&sort=random"
        let encodedQuery: String = query.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let queryURL: URL = URL(string: encodedQuery)!
            
        var requestURL = URLRequest(url: queryURL)
        requestURL.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        requestURL.addValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        requestURL.addValue(clientKey, forHTTPHeaderField: "X-Naver-Client-Secret")
          
        let task = URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            guard error == nil else {print(error ?? ""); return}
            guard let safeData = data else {print("data not found"); return}
             
            do {
                let searchInfo: SearchResult = try self.jsonDecoder.decode(SearchResult.self, from: safeData)
                dataManager.shared.searchResult = searchInfo
                self.urlTaskDone()
                } catch {}
        }
        task.resume()
    }
}

