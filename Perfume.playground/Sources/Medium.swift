import Foundation

public enum Medium {
    case APC
    case acidCleaner
    case antiperspirant
    case bleach
    case fabricConditioner
    case fabricDetergentLiquid
    case powderDetergent
    case shampoo
    case soap
    case bodyLotion
    case antiperspirantRollOn15percent
    case fineFragrance
    case liquidDetergent
    case candles
    case unknown
}

public extension Medium {
    init(_ string: String) {
        let low = string.lowercased()
        switch low {
        case "apc", "cleanerapc liquid":
            self = .APC
        case "fine fragrance":
            self = .fineFragrance
        case "acid cleaner", "cleaner liquid citric acid":
            self = .acidCleaner
        case "liquid detergent":
            self = .liquidDetergent
        case "powder detergent", "detergent powder conc.":
            self = .powderDetergent
        case "fabric conditioner":
            self = .fabricConditioner
        case "aP deo":
            self = .antiperspirant
        case "shampoo", "shampoo/shower gel":
            self = .shampoo
        case "soap":
            self = .soap
        case "candles":
            self = .candles
        case "bleach":
            self = .bleach
        case "body lotion":
            self = .bodyLotion
        case "ap roll-on 15%":
            self = .antiperspirantRollOn15percent
        default:
            self = .unknown
        }
    }
}
