import Foundation

extension String {
    func splitOn(string: String) -> [String] {
        return self.replacingOccurrences(of: string, with: "$").split(separator: "$").map { String($0) }
    }
}

public struct Molecule {
    public let name: String
    public let company: CompanyNumber
    public let useLevel: String?
    public let chemicalProperties: ChemicalProperties
    public let impact: Impact?
    public let identification: Identification
    public let family: String
    public let notes: [String]
    public let olfactiveID: String?
    public let olfactiveDescription: String?
    public let gc: String?
    public let usefulIn: String?
    public let stability: [Stability]?
    public let visualAppearance: String?
    public let performance: Performance
    public let flavor: Flavor?
    public let availableSolutions: String?
    
    public enum CompanyNumber {
        case IFF
        case Givaudan(number: String)
        case Symrise(number: String)
        case Firmenich(number: String)
    }
    
    public struct ChemicalProperties: Codable {
        public let logP: String?
        public let molecularWeight: Double?
        public let vaporPressure: String?
        public let flashpoint: String?
        public let molecularFormula: String?
        public let boilingpoint: String?
        public let synonyms: [String]?
        
        init(logP: String? = nil,
             molecularWeight: Double? = nil,
             vaporPressure: String? = nil,
             flashpoint: String? = nil,
             molecularFormula: String? = nil,
             boilingpoint: String? = nil,
             synonyms: [String]? = nil) {
            
            self.logP = logP
            self.molecularWeight = molecularWeight
            self.vaporPressure = vaporPressure
            self.flashpoint = flashpoint
            self.molecularFormula = molecularFormula
            self.boilingpoint = boilingpoint
            self.synonyms = synonyms
        }
    }
    
    public struct Impact: Codable {
        public let top: String
        public let heart: String
        public let base: String
    }
    
    public struct Performance {
        public let bloomInSoap: String?
        public let burningEffectiveness: String?
        public let substantivityDamp: String?
        public let substantivityDry: String?
        public let substantivityGeneral: String?
        public let tenacityOnBlotter: String?
        
        init(bloomInSoap: String? = nil, burningEffectiveness: String? = nil, substantivityDamp: String? = nil, substantivityDry: String? = nil, substantivityGeneral: String? = nil, tenacityOnBlotter: String? = nil) {
            self.bloomInSoap = bloomInSoap
            self.burningEffectiveness = burningEffectiveness
            self.substantivityDamp = substantivityDamp
            self.substantivityDry = substantivityDry
            self.substantivityGeneral = substantivityGeneral
            self.tenacityOnBlotter = tenacityOnBlotter
        }
    }
    
    public struct Flavor {
        public let dosage: String
        public let flavorDescription: [String]?
        public let usefulIn: String?
    }
    
    public init(giv: Givaudan) {
        self.name = giv.general.name
        self.company = CompanyNumber.Givaudan(number: giv.general.givaudanNumber)
        self.useLevel = giv.performance.useLevel
        self.chemicalProperties = ChemicalProperties(logP: giv.physicoChemicalProperties.logP,
                                                     molecularWeight: Double(giv.physicoChemicalProperties.molecularWeight) ?? 0.0,
                                                     vaporPressure: giv.physicoChemicalProperties.vapourPressure,
                                                     flashpoint: nil,
                                                     molecularFormula: giv.physicoChemicalProperties.formula,
                                                     synonyms: giv.physicoChemicalProperties.name.splitOn(string: ", "))
        self.impact = nil
        self.identification = Identification(cas: giv.physicoChemicalProperties.casNumber)
        self.family = giv.general.family
        self.notes = giv.general.note
        self.olfactiveID = nil
        self.olfactiveDescription = giv.general.description
        self.gc = nil
        self.usefulIn = nil
        self.stability = [ Stability(medium: .APC, ph: Double(giv.stability.APC.ph), odour: StabilityScore.init(giv.stability.APC.odour)),
                           Stability(medium: .acidCleaner, ph: Double(giv.stability.acidCleaner.ph), odour: StabilityScore.init(giv.stability.acidCleaner.odour)),
                           Stability(medium: .antiperspirant, ph: Double(giv.stability.antiperspirant.ph), odour: StabilityScore.init(giv.stability.antiperspirant.odour)),
                           Stability(medium: .bleach, ph: Double(giv.stability.bleach.ph), odour: StabilityScore.init(giv.stability.bleach.odour)),
                           Stability(medium: .fabricConditioner, ph: Double(giv.stability.fabricConditioner.ph), odour: StabilityScore.init(giv.stability.fabricConditioner.odour)),
                           Stability(medium: .fabricDetergentLiquid, ph: Double(giv.stability.fabricDetergentLiquid.ph), odour: StabilityScore.init(giv.stability.fabricDetergentLiquid.odour)),
                           Stability(medium: .powderDetergent, ph: Double(giv.stability.powderDetergent.ph), odour: StabilityScore.init(giv.stability.powderDetergent.odour))
        ]
        self.visualAppearance = nil
        self.performance = Performance(bloomInSoap: giv.performance.bloomInSoap,
                                       burningEffectiveness: giv.performance.burningEffectiveness,
                                       substantivityDamp: giv.performance.substantivityDamp,
                                       substantivityDry: giv.performance.substantivityDry,
                                       tenacityOnBlotter: giv.performance.tenacityOnBlotter)
        self.flavor = nil
        self.availableSolutions = nil
    }
    
    public init(IFF: IFF) {
        self.name = IFF.name
        self.company = CompanyNumber.IFF
        self.useLevel = IFF.useLevel
        self.chemicalProperties = ChemicalProperties(logP: IFF.logP,
                                                     molecularWeight: Double(IFF.molecularWeight ?? "0") ?? 0.0,
                                                     vaporPressure: IFF.vaporPressure,
                                                     flashpoint: IFF.flashpoint,
                                                     synonyms: [IFF.formula])
        if let IFFimpact = IFF.impact {
            self.impact = Impact(top: IFFimpact.top, heart: IFFimpact.heart, base: IFFimpact.base)
        } else {
            self.impact = nil
        }
        
        self.identification = Identification(cas: IFF.identificationNumbers.cas,
                                             ipc: IFF.identificationNumbers.ipc,
                                             reach: IFF.identificationNumbers.reach)
        self.family = IFF.family
        self.notes = IFF.facet.splitOn(string: ",")
        self.olfactiveID = IFF.olfactiveId
        self.olfactiveDescription = IFF.olfactoryDescription
        self.gc = IFF.gc
        self.usefulIn = IFF.uses
        
        if let performanceTable = IFF.performanceTable {
            self.stability = performanceTable.map({ (item) -> Stability in
                Stability(medium: Medium.init(item.product), stability: StabilityScore.init(item.stability), ph: nil, odour:  StabilityScore.init(item.performance))
            })
        } else {
            self.stability = nil
        }
        self.visualAppearance = IFF.visual
        self.performance = Performance(substantivityGeneral: IFF.substantivity)
        self.flavor = nil
        self.availableSolutions = nil
    }
    
    public init(Symrise: Symrise) {
        self.name = Symrise.productName
        self.company = .Symrise(number: Symrise.productNumber)
        self.useLevel = Symrise.useLevel
        self.chemicalProperties = ChemicalProperties(logP: nil,
                                                     molecularWeight: Double(Symrise.molecularWeight) ?? 0.0,
                                                     vaporPressure: nil,
                                                     flashpoint: nil,
                                                     synonyms: Symrise.synonyms.splitOn(string: ", "))
        self.impact = nil
        self.identification = Identification(cas: Symrise.CASNumber,
                                             fema: Symrise.FEMANumber,
                                             flavis: Symrise.FLAVISNumber,
                                             inci: Symrise.INCIName,
                                             iupac: Symrise.IUPACName)
        self.family = Symrise.olfactoryFamily
        self.notes = Symrise.olfactoryDescription ?? [String]()
        self.olfactiveID = nil
        self.olfactiveDescription = Symrise.perfumeryUse
        self.gc = nil
        self.usefulIn = nil
        if let stabilityTable = Symrise.stability {
            self.stability = stabilityTable.compactMap { (dict) -> Stability? in
                guard let item = dict.first else { return nil }
                return Stability(medium: Medium.init(item.key), stability: StabilityScore.init(item.value))
            }
        } else {
            self.stability = nil
        }
        self.visualAppearance = nil
        self.performance = Performance()
        self.flavor = Flavor(dosage: Symrise.dosage, flavorDescription: Symrise.flavorDescription, usefulIn: Symrise.usefulIn)
        self.availableSolutions = Symrise.availableSolutions
    }
    
    public init(Firmenich: Firmenich) {
        self.name = Firmenich.name
        self.company = .Firmenich(number: Firmenich.productNumber)
        self.useLevel = nil
        self.chemicalProperties = ChemicalProperties(logP: Firmenich.logP,
                                                     molecularWeight: Firmenich.molecularWeight,
                                                     vaporPressure: Firmenich.vaporPressure,
                                                     flashpoint: Firmenich.flashpoint,
                                                     molecularFormula: nil,
                                                     boilingpoint: Firmenich.boilingpoint,
                                                     synonyms: [Firmenich.synonym])
        self.impact = Impact(top: Firmenich.top ? "3" : "0",
                             heart: Firmenich.heart ? "3" : "0",
                             base: Firmenich.base ? "3" : "0")
        self.identification = Firmenich.identification
        self.family = Firmenich.family
        self.notes = [String]()
        self.olfactiveID = nil
        self.olfactiveDescription = Firmenich.olfactiveDescription
        self.gc = nil
        self.usefulIn = nil
        self.stability = Firmenich.stability
        self.visualAppearance = Firmenich.appearance
        self.performance = Performance()
        self.flavor = nil
        self.availableSolutions = nil
    }
}
