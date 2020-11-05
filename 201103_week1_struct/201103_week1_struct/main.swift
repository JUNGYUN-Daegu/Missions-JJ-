//
//  main.swift
//  201103_week1_struct
//
//  Created by 조중윤 on 2020/11/03.
//

import Foundation

//Mission 3-3

//MARK: - POINT STRUCTURE
struct MyPoint {
    var myX: Float
    var myY: Float
    
    mutating func setX(x: Float) {
        myX = x
    }
    mutating func setY(y: Float) {
        myY = y
    }
    
    func getDistanceTo(toPoint: MyPoint) -> Float {
        let axisXdiff = pow((myX - toPoint.myX), 2)
        let axisYdiff = pow((myY - toPoint.myY), 2)
        let distance = sqrtf(axisXdiff + axisYdiff)
        return distance
    }
}

//MARK: - INITIALIZING
var pointA = MyPoint(myX: 2.5, myY: 15.8)
pointA.setX(x: 15.2)
pointA.setY(y: 7.4)
print("point A = (\(pointA.myX) | \(pointA.myY))")

var pointB = MyPoint(myX: 15.0, myY: 12.2)
print("The distance to the pointB is \(pointA.getDistanceTo(toPoint: pointB)))")

//MARK: - RECTANGLE STRUCTURE
struct Rectangle {
    var leftTop: MyPoint
    var rightBottom: MyPoint
    
    func printRect() {
        print("leftTop is (\(leftTop.myX).\(leftTop.myY))")
        print("leftBottom is (\(leftTop.myX).\(rightBottom.myY))")
        print("rightTop is (\(rightBottom.myX).\(leftTop.myY))")
        print("rightBottom is (\(rightBottom.myX).\(rightBottom.myY))")
    }
    
    func printArea() {
        let area = (leftTop.myY - rightBottom.myY) * (rightBottom.myX - leftTop.myX)
        print("The area of the rectangle is \(area)")
    }
    
    func printCenter() {
        let centerCoordinateX = (leftTop.myX + rightBottom.myX) / 2
        let centerCoordinateY = (leftTop.myY + rightBottom.myY) / 2
        print("The centerCoordinate is (\(centerCoordinateX).\(centerCoordinateY))")
    }
    
    func calculateWidthAndHeight() -> (Float, Float) {
        let width = rightBottom.myX - leftTop.myX
        let height = leftTop.myY - rightBottom.myY
        return (width, height)
    }
    
    func createRect(fromPoint: MyPoint, width: Float, height: Float) {
        let leftTop: MyPoint = MyPoint(myX: fromPoint.myX, myY: fromPoint.myY + height)
        let leftBottom: MyPoint = MyPoint(myX: fromPoint.myX, myY: fromPoint.myY)
        let rightTop: MyPoint = MyPoint(myX: fromPoint.myX + width, myY: fromPoint.myY + height)
        let rightBottom: MyPoint = MyPoint(myX: fromPoint.myX + width, myY: fromPoint.myY)
        
        print("Left top point : \(leftTop)")
        print("Left bottom point : \(leftBottom)")
        print("Right top point : \(rightTop)")
        print("Rgiht bottom point : \(rightBottom)")
    }
    
    mutating func moveTo(delta: MyPoint) {
        self.leftTop.myY += delta.myY
        self.leftTop.myX += delta.myX
        self.rightBottom.myY += delta.myY
        self.rightBottom.myX += delta.myX
        printRect()
    }
}

//MARK: - INITIALIZING
var rightBottomPoint: MyPoint = MyPoint(myX: 10.0, myY: 5.0)
var leftTopPoint: MyPoint = MyPoint(myX: 5.0, myY: 15.0)
var startPoint: MyPoint = MyPoint(myX: 5.0, myY: 5.0)

var rect = Rectangle(leftTop: leftTopPoint, rightBottom: rightBottomPoint)
rect.printRect()
rect.printArea()
rect.printCenter()
rect.moveTo(delta: MyPoint(myX: -3, myY: 4))

var rectB = Rectangle(leftTop: leftTopPoint, rightBottom: rightBottomPoint)
let widthAndHeight = rectB.calculateWidthAndHeight()
rectB.createRect(fromPoint: startPoint, width: widthAndHeight.0, height: widthAndHeight.1)

