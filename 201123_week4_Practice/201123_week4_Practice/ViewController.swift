//
//  ViewController.swift
//  201123_week4_Practice
//
//  Created by 조중윤 on 2020/11/23.
//

import UIKit

class ViewController: UIViewController {
    // MARK:- Properties
    let calendar = NSCalendar.current
    var timer = Timer()
    var currentHour = DateComponents().hour ?? 0
    var currentMinute = DateComponents().minute ?? 0
    var currentSecond = DateComponents().second ?? 0
    
    // MARK:- IBOutlets
    @IBOutlet var ampmLblCollection: [UILabel]!
    @IBOutlet weak var emojiLbl: UILabel!
    @IBOutlet var hourLblCollection: [UILabel]!
    @IBOutlet var hourEightLblCollection: [UILabel]!
    @IBOutlet var minuteTensPlaceLblCollection: [UILabel]!
    @IBOutlet var minuteLblCollection: [UILabel]!
    @IBOutlet weak var secondTensPlaceLbl: UILabel!
    @IBOutlet weak var secondTensPlaceUnitLbl: UILabel!
    @IBOutlet weak var secondLbl: UILabel!
    @IBOutlet weak var secondUnitLbl: UILabel!
    @IBOutlet var unitLblCollection: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for everyLetter in unitLblCollection {
            letterSelected(label: everyLetter)
        }
        ampmLblCollection.forEach { (uilabel) in
            letterSelected(label: uilabel)
        }
        hourLblCollection.forEach { (uilabel) in
            letterSelected(label: uilabel)
        }
        hourEightLblCollection.forEach { (uilabel) in
            letterSelected(label: uilabel)
        }
        minuteTensPlaceLblCollection.forEach { (uilabel) in
            letterSelected(label: uilabel)
        }
        minuteLblCollection.forEach { (uilabel) in
            letterSelected(label: uilabel)
        }
        letterSelected(label:secondTensPlaceLbl)
        letterSelected(label:secondLbl)
        letterSelected(label:secondTensPlaceUnitLbl)
        letterSelected(label:secondUnitLbl)
        
        // timer도 메인스레드에 작업을 올리는 비동기 형식이라고 볼 수 있음. 단 DispatchQueue를 쓰면 좀 더 다양한 기능 가능
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (_) in
            let currentTime = self.calendar.dateComponents([.hour, .minute, .second,], from: Date())
            self.currentHour = currentTime.hour!
            self.currentMinute = currentTime.minute!
            self.currentSecond = currentTime.second!
            self.updateUI()
        }
    }
    
    // MARK:- FUNCTIONS
    func updateUI() {
        // MARK:- ampm letter UI update
        if currentHour < 12 {
            for label in ampmLblCollection {
                if label.text == "후" {
                    letterDeselected(label: label)
                } else {
                    letterSelected(label: label)
                }
            }
        } else {
            for label in ampmLblCollection {
                if label.text == "전" {
                    letterDeselected(label: label)
                } else {
                    letterSelected(label: label)
                }
            }
        }
        
        // MARK:- emoji UI update
        switch currentHour {
        case 7..<19: emojiLbl.text = "☀️"
        default: emojiLbl.text = "🌙"
        }
        
        // MARK:- hour letter UI update
        for label in hourEightLblCollection {
            letterDeselected(label: label)
        }
        switch currentHour % 12 {
        case 0:
            for label in hourLblCollection {
                if label.text == "영" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 1:
            for label in hourLblCollection {
                if label.text == "한" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 2:
            for label in hourLblCollection {
                if label.text == "두" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 3:
            for label in hourLblCollection {
                if label.text == "세" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 4:
            for label in hourLblCollection {
                if label.text == "네" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 5:
            for label in hourLblCollection {
                if label.text == "다" || label.text! == "섯" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 6:
            for label in hourLblCollection {
                if label.text == "여" || label.text! == "섯" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 7:
            for label in hourLblCollection {
                if label.text == "일" || label.text! == "곱" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 8:
            for label in hourEightLblCollection {
                letterSelected(label: label)
            }
            for label in hourLblCollection {
                letterDeselected(label: label)
            }
        case 9:
            for label in hourEightLblCollection {
                letterDeselected(label: label)
            }
            for label in hourLblCollection {
                if label.text == "아" || label.text! == "홉" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 10:
            for label in hourLblCollection {
                if label.text == "열" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 11:
            for label in hourLblCollection {
                if label.text == "열" || label.text! == "한" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        default:
            for label in hourLblCollection {
                    letterDeselected(label: label)
            }
        }
        
        
        // MARK:- minute letter UI update(Tens Place)
        switch (currentMinute / 10) {
        case 1:
            for label in minuteTensPlaceLblCollection {
                if label.text == "십" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 2:
            for label in minuteTensPlaceLblCollection {
                if label.text == "십" || label.text == "이" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 3:
            for label in minuteTensPlaceLblCollection {
                if label.text == "십" || label.text == "삼" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 4:
            for label in minuteTensPlaceLblCollection {
                if label.text == "십" || label.text == "사" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 5:
            for label in minuteTensPlaceLblCollection {
                if label.text == "십" || label.text == "오" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        default:
            for label in minuteTensPlaceLblCollection {
                letterDeselected(label: label)
            }
        }
        
        // MARK:- minute letter UI update(unit Place)
        switch currentMinute % 10 {
        case 1:
            for label in minuteLblCollection {
                if label.text == "일" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 2:
            for label in minuteLblCollection {
                if label.text! == "이" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 3:
            for label in minuteLblCollection {
                if label.text! == "삼" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 4:
            for label in minuteLblCollection {
                if label.text! == "사" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 5:
            for label in minuteLblCollection {
                if label.text! == "오" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 6:
            for label in minuteLblCollection {
                if label.text! == "육" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 7:
            for label in minuteLblCollection {
                if label.text! == "칠" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 8:
            for label in minuteLblCollection {
                if label.text! == "팔" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        case 9:
            for label in minuteLblCollection {
                if label.text! == "구" {
                    letterSelected(label: label)
                } else {
                    letterDeselected(label: label)
                }
            }
        default:
            for label in minuteLblCollection {
                letterDeselected(label: label)
            }
        }
        
        
        // MARK:- second letter UI update(tens place)
        
        switch currentSecond / 10 {
        case 1:
            secondTensPlaceLbl.isHidden = true
            secondTensPlaceUnitLbl.isHidden = false
            letterSelected(label: secondTensPlaceUnitLbl)
        case 2:
            secondTensPlaceLbl.isHidden = false
            secondTensPlaceLbl.text! = "이"
            letterSelected(label: secondTensPlaceLbl)
        case 3:
            secondTensPlaceLbl.text! = "삼"
        case 4:
            secondTensPlaceLbl.text! = "사"
        case 5:
            secondTensPlaceLbl.text! = "오"
        default:
            secondTensPlaceLbl.isHidden = true
            secondTensPlaceUnitLbl.isHidden = true
            letterDeselected(label: secondTensPlaceLbl)
            letterDeselected(label: secondTensPlaceUnitLbl)
        }
        
        
        // MARK:- second letter UI update(unit place)
        switch currentSecond % 10 {
        case 1:
            secondLbl.isHidden = false
            secondLbl.text = "일"
            secondUnitLbl.text = "초"
            letterSelected(label: secondLbl)
        case 2:
            secondLbl.text = "이"
        case 3:
            secondLbl.text = "삼"
        case 4:
            secondLbl.text = "사"
        case 5:
            secondLbl.text = "오"
        case 6:
            secondLbl.text = "육"
        case 7:
            secondLbl.text = "칠"
        case 8:
            secondLbl.text = "팔"
        case 9:
            secondLbl.text = "구"
        default:
            if currentSecond / 10 == 0 {
                secondLbl.text! = "정"
                secondUnitLbl.text! = "각"
            } else {
                secondLbl.isHidden = true
            }
        }
    }
    
    func letterSelected(label: UILabel) {
            label.textColor = UIColor.systemPink
    }
    
    func letterDeselected(label: UILabel) {
            label.textColor = UIColor.systemGray
    }
}

