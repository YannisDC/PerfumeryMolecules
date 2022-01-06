import UIKit

var molecules = [Molecule]()

// MARK: - Givaudan

let filemanager:FileManager = FileManager()

//var givaudanProducts = [Givaudan]()
//let givfiles = filemanager.enumerator(atPath: "/Users/yannisdecl/Clients/Hojate/Perfume.playground/Resources/Givaudan")
//while let file = givfiles?.nextObject() {
//    do {
//        let filename = file as! String
//        let data = FileManager.default.contents(atPath: "/Users/yannisdecl/Clients/Hojate/Perfume.playground/Resources/Givaudan/"+filename)!
//        let product: Givaudan = try JSONDecoder().decode(Givaudan.self, from: data)
//        givaudanProducts.append(product)
//
//    } catch DecodingError.dataCorrupted(let context) {
//        print(context)
//    }
//}
//
//let molGivaudan = Molecule(giv: givaudanProducts[0])
//print(molGivaudan.name)
//print(molGivaudan.stability)
//
//molecules.append(contentsOf: givaudanProducts.map {Molecule(giv: $0)})


var symriseProducts = [Symrise]()
let symfiles = filemanager.enumerator(atPath: "/Users/yannisdecl/Clients/Hojate/Perfume.playground/Resources/Symrise")
while let file = symfiles?.nextObject() {
    do {
        let filename = file as! String
        let data = FileManager.default.contents(atPath: "/Users/yannisdecl/Clients/Hojate/Perfume.playground/Resources/Symrise/"+filename)!
        let product: Symrise = try JSONDecoder().decode(Symrise.self, from: data)
        symriseProducts.append(product)

    } catch (let context) {
        print(context)
    }
}

if let aldron = symriseProducts.filter({ $0.productName == "Aldron®" }).first {
    let molSymrise = Molecule(Symrise: aldron)
    print(molSymrise.name)
    print(molSymrise.stability)
}


molecules.append(contentsOf: symriseProducts.map {Molecule(Symrise: $0)})


var IFFProducts = [IFF]()
let IFFfiles = filemanager.enumerator(atPath: "/Users/yannisdecl/Clients/Hojate/Perfume.playground/Resources/IFF")
while let file = IFFfiles?.nextObject() {
    do {
        let filename = file as! String
        let data = FileManager.default.contents(atPath: "/Users/yannisdecl/Clients/Hojate/Perfume.playground/Resources/IFF/"+filename)!
        let product: IFF = try JSONDecoder().decode(IFF.self, from: data)
        IFFProducts.append(product)

    } catch (let context) {
        print(context)
    }
}

//let molIFF = Molecule(IFF: IFFProducts.filter({ $0.name == "Verbenal" })[0])
//print(molIFF.name)
//print(molIFF.stability)

molecules.append(contentsOf: IFFProducts.map {Molecule(IFF: $0)})
molecules.count

print(molecules.first)
