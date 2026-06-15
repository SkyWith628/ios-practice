import Foundation

enum BMICategory {
    case underweight
    case normal
    case obese1
    case obese2
    case obese3

    var description: String {
        switch self {
        case .underweight: return "저체중"
        case .normal:      return "정상"
        case .obese1:      return "1단계 비만"
        case .obese2:      return "2단계 비만"
        case .obese3:      return "3단계 비만"
        }
    }
}

struct BMI {
    let weight: Double
    let height: Double

    var value: Double {
        let meter = height / 100.0
        return weight / (meter * meter)
    }

    var category: BMICategory {
        switch value {
        case ..<18.5:
            return .underweight
        case 18.5..<25:
            return .normal
        case 25..<30:
            return .obese1
        case 30..<40:
            return .obese2
        default:
            return .obese3
        }
    }

    var resultText: String {
        let shortened = String(format: "%.1f", value)
        return "BMI: \(shortened), 판정: \(category.description)"
    }
}
