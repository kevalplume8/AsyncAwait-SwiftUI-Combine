import Foundation

public struct ProductDomainModel: Equatable {
    public let name : String
    public let tagline: String
    public let rating: Double
    public let date: String
}

public extension ProductDomainModel {
    var roundedRating: String {
        String(format: "%.1f", calculateNearestHalf())
    }
    
    private func calculateNearestHalf() -> Double {
        round(rating * 2) / 2
    }
}
