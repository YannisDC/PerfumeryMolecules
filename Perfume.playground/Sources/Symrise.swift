import Foundation

public struct Symrise: Codable {
    public let CASNumber: String
    public let FEMANumber: String
    public let FLAVISNumber: String
    public let INCIName: String
    public let IUPACName: String
    public let availableSolutions: String
    public let dosage: String
    public let flavorDescription: [String]?
    public let molecularWeight: String
    public let olfactoryDescription: [String]?
    public let olfactoryFamily: String
    public let perfumeryUse: String
    public let productName: String
    public let productNumber: String
    public let stability: [[String: String]]?
    public let synonyms: String
    public let useLevel: String
    public let usefulIn: String
}
