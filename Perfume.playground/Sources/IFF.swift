import Foundation

public struct IFF: Codable {
    public let facet: String
    public let family: String
    public let flashpoint: String?
    public let formula: String
    public let gc: String?
    public let identificationNumbers: IdentificationNumbers
    public let impact: Impact?
    public let logP: String
    public let molecularWeight: String?
    public let name: String
    public let olfactiveId: String?
    public let olfactoryDescription: String
    public let performanceTable: [PerformanceItem]?
    public let substantivity: String?
    public let useLevel: String?
    public let uses: String?
    public let vaporPressure: String
    public let visual: String?
    
    public struct IdentificationNumbers: Codable {
        public let cas: String?
        public let ipc: String?
        public let reach: String?
    }
    
    public struct Impact: Codable {
        public let top: String
        public let heart: String
        public let base: String
    }
    
    public struct PerformanceItem: Codable {
        public let performance: String
        public let product: String
        public let stability: String
    }
}


