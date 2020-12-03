//
//  fallingObject.swift
//  201130_week5_FinalProject
//
//  Created by 조중윤 on 2020/11/30.
//

import UIKit

// reusables
class SnowEmitter {
    let emitter = CAEmitterLayer()
    
    func get(icon1: UIImage, icon2: UIImage) -> CAEmitterLayer {
        // default: a dot spreading cells to all directions.
        emitter.emitterShape = .line
        emitter.emitterCells = generateEmitterCells(icon1, icon2)
        return emitter
    }
    
    func generateEmitterCells(_ icon1: UIImage, _ icon2: UIImage) -> [CAEmitterCell] {
        var cells = [CAEmitterCell]()
    
        let cell1 = CAEmitterCell()
        // cgImage: core graphic representation of UIImage
        cell1.contents = icon1.cgImage
        cell1.birthRate = 2
        cell1.lifetime = 50
        // velocity: 속도 + 방향: velocity 설정 안해주면 particles가 이동하지 않음
        cell1.velocity = CGFloat(30)
        // to set which direction the objects fall, since default value is going up, we need to turn it 180 degree
        cell1.emissionLongitude = (180 * (.pi/180))
        // to spead the cells. in cone shape
        cell1.emissionRange = (45 * (.pi/180))
        cell1.scale = 0.5
        cell1.scaleRange = 0.01
        cell1.scaleSpeed = 0.01
        cell1.spinRange = 5
        // to set color of snow. changing color of UIImage itself somehow did not work. so I changed the color of cells
        cell1.color = UIColor.hexString2UIColor(hexString: "#ffdada")?.cgColor
        cells.append(cell1)
        
        let cell2 = CAEmitterCell()
        cell2.contents = icon1.cgImage
        cell2.birthRate = 0.5
        cell2.lifetime = 60
        cell2.velocity = CGFloat(20)
        cell2.emissionLongitude = (180 * (.pi/180))
        cell2.emissionRange = (45 * (.pi/180))
        cell2.scale = 0.3
        cell2.scaleRange = 0.01
        cell2.scaleSpeed = 0.01
        cell2.spinRange = 20
        cell2.color = UIColor.hexString2UIColor(hexString: "#9ddfd3")?.cgColor
        cells.append(cell2)
        
        let cell3 = CAEmitterCell()
        cell3.contents = icon2.cgImage
        cell3.birthRate = 0.5
        cell3.lifetime = 15
        cell3.velocity = CGFloat(100)
        cell3.emissionLongitude = (180 * (.pi/180))
        cell3.emissionRange = (45 * (.pi/180))
        cell3.scale = 0.06
        cell3.spinRange = 2
        cells.append(cell3)
        
        return cells
    }
}


