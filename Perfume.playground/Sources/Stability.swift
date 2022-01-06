import Foundation

public enum StabilityScore {
    case poor
    case moderate
    case good
    case veryGood
    case unknown
}

public extension StabilityScore {
    init(_ string: String) {
        let low = string.lowercased()
        switch low {
        case "poor", "1":
            self = .poor
        case "moderate", "2":
            self = .moderate
        case "good", "3":
            self = .good
        case "very good", "4":
            self = .veryGood
        default:
            self = .unknown
        }
    }
}

public enum Substantivity {
    case wet(score: Int)
    case dry(score: Int)
    case bloom(score: Int)
    case foam(score: Int)
    case dryHand(score: Int)
    case coldWax(score: Int)
    case burning(score: Int)
}

public struct Stability {
    public let medium: Medium
    public let stability: StabilityScore?
    public let ph: Double?
    public let odour: StabilityScore?
    public let concentration: String?
    public let substantivityAndRemarks: [Substantivity]?
    
    init(medium: Medium,
         stability: StabilityScore? = nil,
         ph: Double? = nil,
         odour: StabilityScore? = nil,
         concentration: String? = nil,
         substantivityAndRemarks: [Substantivity]? = nil) {
        
        self.medium = medium
        self.stability = stability
        self.ph = ph
        self.odour = odour
        self.concentration = concentration
        self.substantivityAndRemarks = substantivityAndRemarks
    }
}

public struct Identification {
    public let cas: String?
    public let ipc: String?
    public let reach: String?
    public let fema: String?
    public let flavis: String?
    public let inci: String?
    public let iupac: String?
    
    init(cas: String? = nil, ipc: String? = nil, reach: String? = nil, fema: String? = nil, flavis: String? = nil, inci: String? = nil, iupac: String? = nil) {
        self.cas = cas
        self.ipc = ipc
        self.reach = reach
        self.fema = fema
        self.flavis = flavis
        self.inci = inci
        self.iupac = iupac
    }
}
