import Foundation

public struct Firmenich {
    public let family: String
    public let name: String
    public let productNumber: String
    public let synonym: String
    public let identification: Identification
    public let tenacity: String?
    public let logP: String?
    public let appearance: String?
    public let flashpoint: String?
    public let vaporPressure: String?
    public let molecularWeight: Double?
    public let boilingpoint: String?
    public let olfactiveDescription: String?
    public let perfumeUsage: String?
    public let stability: [Stability]?
    public let top: Bool
    public let heart: Bool
    public let base: Bool
}

/*
let fir = Firmenich(family: "AMBERY",
name: "AMBROX® SUPER",
productNumber: "909158",
synonym: "Naphtho[2,1-b]furan, dodecahydro-3a,6,6,9a-tetramethyl-, [3aR-",
identification: Identification(cas: "0006790-58-5",
                                      reach: "01-2120070784-50",
                                      fema: "3471"),
tenacity: "Lasts 1 month on a smelling strip",
logP: "6.85",
appearance: "CRYSTALLINE POWDER",
flashpoint: ">100°C",
vaporPressure: "0.29 Pa at 20°C",
molecularWeight: 236.0,
boilingpoint: nil,
olfactiveDescription: "Extremely powerful and elegant ambery odor with a musky, woody tonality. From its discovery by Firmenich in the 1950’s to its breakthrough new production process via white biotechnology in 2016, AMBROX® SUPER delivers all the promises of sleek elegance and powerful iconic ambery signature. Sparkling sensuality, AMBROX® SUPER offers musky and woody tonalities to the emblematic’ family of ambery ingredients. Compared to CETALOX®, the profile of AMBROX® SUPER is more natural, more animalic, closer to ambregris in which it had been discovered (the profile of CETALOX® is more woody, dry).",
perfumeUsage: "AMBROX® SUPER is highly diffusive and brings a unique ambery effect from top notes to dry down.",
stability: [ Stability(medium: Medium.fineFragrance, stability: StabilityScore("4"), ph: nil, odour: nil, concentration: "0,6% - 3%") ],
top: false,
heart: true,
base: true)

let m = Molecule(Firmenich: fir)
print(m)
 */
