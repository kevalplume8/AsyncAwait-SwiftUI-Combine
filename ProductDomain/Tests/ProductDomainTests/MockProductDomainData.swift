@testable import ProductDomain

struct MockProductDomainData {
    static let chair = ProductDomainModel(name: "Chair", tagline: "Comfy Chair", rating: 3.9123, date: "05-04-2023")
    static let stool = ProductDomainModel(name: "Stool", tagline: "Comfy Chair", rating: 4.123, date: "05-04-2023")
    static let table = ProductDomainModel(name: "Table", tagline: "Comfy Chair", rating: 2.5, date: "05-04-2023")
}
