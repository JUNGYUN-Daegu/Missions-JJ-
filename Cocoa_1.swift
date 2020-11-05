
import Foundation

func convertToCM(fromInches: Float) -> Float {
    let result:Float = fromInches * 2.54
    return result
}

let cm1 = convertToCM(fromInches: 50)
let cm2 = convertToCM(fromInches: 15)
print(cm1, cm2, separator: " || ")

func convertToInches(fromCM: Float) -> Float {
    let result:Float = (fromCM / 2.54)
    return result
}

let inch1 = convertToInches(fromCM: 254)
let inch2 = convertToInches(fromCM: 75)
print(inch1, inch2, separator: " || ")

func convertMeterToCM(meter: Float) -> Float {
    let result:Float = meter * 100
    return result
}

func convertToInches(fromMeter: Float) -> Float {
    let result = convertToInches(fromCM: convertMeterToCM(meter: fromMeter))
    return result
}

let inch3 = convertToInches(fromMeter: 1.5)
let inch4 = convertToInches(fromMeter: 0.4)
print(inch3, inch4, separator: " || ")


//MARK: - 추가미션

func integratedCalculator (input: String) -> Float {
    let array = input.components(separatedBy: " ")
    var result:Float = 0.0
    if array.count == 1 {
        if array[0].contains("cm") {
            let floatValueFromString = Float(array[0].replacingOccurrences(of: "cm", with: "")) ?? 0
            let convertedValue = floatValueFromString / 100
            result = convertedValue
        }
        else if array[0].contains("inch") {
            let floatValueFromString = Float(array[0].replacingOccurrences(of: "inch", with: "")) ?? 0
            let convertedValue = convertToCM(fromInches: floatValueFromString)
            result = convertedValue
        }
        else if array[0].contains("m") {
            let floatValueFromString = Float(array[0].replacingOccurrences(of: "m", with: "")) ?? 0
            let convertedValue = convertMeterToCM(meter: floatValueFromString)
            result = convertedValue
        }
    } else if array.count == 2 {
        if array[0].contains("cm") {
            let floatValueFromString = Float(array[0].replacingOccurrences(of: "cm", with: "")) ?? 0
            if array[1] == "inch" {
                let convertedValue = convertToInches(fromCM:floatValueFromString)
                result = convertedValue
            }
            else if array[1] == "m" {
                let convertedValue = floatValueFromString * 100
                result = convertedValue
            }
        }
        else if array[0].contains("inch") {
            let floatValueFromString = Float(array[0].replacingOccurrences(of: "inch", with: "")) ?? 0
            if array[1] == "cm" {
                let convertedValue = convertToCM(fromInches:floatValueFromString)
                result = convertedValue
            }
            else if array[1] == "m" {
                let convertedValue = convertToCM(fromInches: floatValueFromString) / 100
                result = convertedValue
            }
        }
        else if array[0].contains("m") {
            let floatValueFromString = Float(array[0].replacingOccurrences(of: "m", with: "")) ?? 0
            if array[1] == "cm" {
                let convertedValue = convertMeterToCM(meter: floatValueFromString)
                result = convertedValue
            }
            else if array[1] == "inch" {
                let convertedValue = convertToInches(fromMeter: floatValueFromString)
                result = convertedValue
            }
        }
    }
    return result
}
print(integratedCalculator(input: "123inch"))


//미션1,2,3 여러가지 시도...(추가미션을 하기 위한 ..?)
typealias UnitValue = String
enum UnitType: String {
    case CM, M, Inch
}

func main(from unit: String, to: String) {
    let fromUnit = divideFromUnit(fromChar: unit).1
    let fromUnitValue = divideFromUnit(fromChar: unit).0
    
    let toValue = convertTo(from: fromUnit, to: to, value: fromUnitValue)
    printValue(toVlaue: toValue, toUnit: to)
}

func convertTo(from: String, to: String, value: String) -> Double {
    let convertableValue = (value as NSString).doubleValue
    
    switch (from, to) {
    case ("CM", "M"): return convertableValue / 100
    case ("CM", "Inch"): return convertableValue / 2.54
    case ("M", "Inch"): return convertableValue * 39.370079
    case ("M", "CM"): return convertableValue * 100
    case (_, _):
        return 0
    }
}

func divideFromUnit(fromChar: String) -> (UnitValue, UnitType.RawValue) {
    let characterSet: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var unitType = ""
    var unitValue = ""
    
    for char in fromChar {
        guard characterSet.contains(char) else {
            unitValue.append(char)
            continue
        }
        unitType.append(char)
    }
    return (unitValue, unitType)
}

func printValue(toVlaue: Double, toUnit: String) {
    print("\(toVlaue)\(toUnit)")
}

main(from: "50CM", to: "Inch")
