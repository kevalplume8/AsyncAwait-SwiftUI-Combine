import Foundation

public struct ProductPresentationModel: Identifiable, Equatable{
    public let id: UUID = UUID()
    public let name : String
    public let tagline: String
    public let rating: String
}

public extension ProductPresentationModel {
    var formattedRating: String {
        "★ " + rating
    }
}
