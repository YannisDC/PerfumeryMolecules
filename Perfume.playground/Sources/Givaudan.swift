import Foundation

public struct Givaudan: Codable {
    public let general: General
    public let performance: Performance
    public let physicoChemicalProperties: PhysicoChemicalProperties
    public let stability: Stability
    
    public struct General: Codable {
        public let description: String
        public let family: String
        public let givaudanNumber: String
        public let name: String
        public let note: [String]
    }
    
    public struct Performance: Codable {
        public let bloomInSoap: String
        public let burningEffectiveness: String
        public let substantivityDamp: String
        public let substantivityDry: String
        public let tenacityOnBlotter: String
        public let useLevel: String
    }
    
    public struct PhysicoChemicalProperties: Codable {
        public let casNumber: String
        public let formula: String
        public let logP: String
        public let molecularWeight: String
        public let name: String
        public let vapourPressure: String
    }
    
    public struct Stability: Codable {
        public let APC: StabilityItem
        public let acidCleaner: StabilityItem
        public let antiperspirant: StabilityItem
        public let bleach: StabilityItem
        public let fabricConditioner: StabilityItem
        public let fabricDetergentLiquid: StabilityItem
        public let powderDetergent: StabilityItem
        public let shampoo: StabilityItem
        public let soap: StabilityItem
        
        public struct StabilityItem: Codable {
            public let odour: String
            public let ph: String
        }
    }
}
