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
    let recommendationLabel: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "네이버 추천 맛집"
         label.backgroundColor = UIColor.hexString2UIColor(hexString: "#9ddfd3")
         label.numberOfLines = 0
         label.textAlignment = .center
         label.textColor = UIColor.hexString2UIColor(hexString: "#31326f")
         label.font = UIFont(name: "Hi Melody", size: 20)
         label.layer.cornerRadius = 10
         label.clipsToBounds = true
         return label
    }()
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "testTitle"
//        label.backgroundColor = UIColor.hexString2UIColor(hexString: "#ffdada")
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.hexString2UIColor(hexString: "#9ddfd3")
        label.font = UIFont(name: "Hi Melody", size: 22)
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "testAddress"
//        label.backgroundColor = UIColor.hexString2UIColor(hexString: "#ffdada")
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.hexString2UIColor(hexString: "#9ddfd3")
        label.font = UIFont(name: "Hi Melody", size: 22)
        return label
    }()
    
    let menuLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "test"
        label.font = UIFont(name: "Hi Melody", size: 40)
        return label
    }()
    
    let menuSelectBtn: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.hexString2UIColor(hexString: "#ffdada")
        button.setTitle("SELECT", for: .normal)
        button.tintColor = UIColor.hexString2UIColor(hexString: "#31326f")
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    let backBtn: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.hexString2UIColor(hexString: "#ffdada")
        button.setTitle("BACK", for: .normal)
        button.tintColor = UIColor.hexString2UIColor(hexString: "#31326f")
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    //MARK:- View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hexString2UIColor(hexString: "#31326f")
        
        view.addSubview(menuLabel)
        menuLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        menuLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        menuLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        menuLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        menuLabel.isHidden = true
        
        view.addSubview(recommendationLabel)
        recommendationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        recommendationLabel.topAnchor.constraint(equalTo: menuLabel.bottomAnchor, constant: view.frame.height * 0.01).isActive = true
        recommendationLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        recommendationLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        recommendationLabel.isHidden = true
        
        view.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: recommendationLabel.bottomAnchor, constant: 10).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
//        titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        titleLabel.isHidden = true
        
        view.addSubview(addressLabel)
        addressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addressLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
//        addressLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        addressLabel.isHidden = true
    
        
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
    //MARK:- Functions
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
            // though you remove the layer, value of layer remains. so needed to trasform back
            self.snowEmitter.emitter.removeFromSuperlayer()
            self.snowEmitter.emitter.transform = CATransform3DMakeScale(1.0, 1.0, 1.0)
        }
        
        let randomFood: String = foodItems.randomElement() ?? "치킨"
        requestAPI(foodName: randomFood)
        if randomFood == "치킨" {
            starIcon = UIImage(named: "fried-chicken")
            menuLabel.text = "역시 오늘 같은 날은 치킨일까?"
        } else if randomFood == "스시" {
            starIcon = UIImage(named: "sushi")
            menuLabel.text = "한국에서 먹는 스시, 오히려 좋아"
        } else if randomFood == "피자" {
            starIcon = UIImage(named: "pizza")
            menuLabel.text = "피자먹고 우리 인상 피자"
        } else if randomFood == "햄버거" {
            starIcon = UIImage(named: "hamburger")
            menuLabel.text = "햄버거를 먹으면 좋은 디버거가 될 수 있을지도..?"
        } else if randomFood == "떡볶이" {
            starIcon = UIImage(named: "bokki")
            menuLabel.text = "오늘은 떡볶이 먹고 벌크업을..."
        } else if randomFood == "케이크" {
            starIcon = UIImage(named: "cake")
            menuLabel.text = "메리 크리스마스"
        } else {
            self.starIcon = UIImage(named: "star")
        }
        menuLabel.isHidden = false
        titleLabel.isHidden = false
        addressLabel.isHidden = false
        recommendationLabel.isHidden = false
        
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
                self.titleLabel.text = item?.title.replacingOccurrences(of: "</b>", with: "").replacingOccurrences(of: "<b>", with: "")
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

