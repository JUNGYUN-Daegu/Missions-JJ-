//
//  ViewController.swift
//  Waiting List Management
//
//  Created by 조중윤 on 2020/11/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var NumberOfPeopleWaitingLbl: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var waitBtnStatus: UIButton!
    @IBOutlet weak var completeBtnStatus: UIButton!
    
    var myListManager = ListManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func waitBtn(_ sender: UIButton) {
        myListManager.addPerson()
        updateUI()
    }
    
    @IBAction func completeBtn(_ sender: UIButton) {
        myListManager.subtractPerson()
        updateUI()
    }
    
    func updateUI() {
        NumberOfPeopleWaitingLbl.text = "\(myListManager.peopleWaiting) 명"
        progressBar.progress = Float(myListManager.peopleWaiting) / 20.0
        
        if myListManager.peopleWaiting == 20 {
            waitBtnStatus.isUserInteractionEnabled = false
            waitBtnStatus.backgroundColor = UIColor.red
        } else if myListManager.peopleWaiting == 0 {
            completeBtnStatus.isUserInteractionEnabled = false
            completeBtnStatus.backgroundColor = UIColor.red
        } else {
            waitBtnStatus.isUserInteractionEnabled = true
            completeBtnStatus.isUserInteractionEnabled = true
            waitBtnStatus.backgroundColor = UIColor.white
            completeBtnStatus.backgroundColor = UIColor.link
        }
    }
}

