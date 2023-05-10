import ProductDomain
import Foundation

public struct ProductListDomainToPresentationModelMapper {
    public init () {}
    public func map(domainModel: [ProductDomainModel]) -> [ProductPresentationModel] {
        domainModel.map {
            ProductPresentationModel(
                name: $0.name,
                tagline: $0.tagline,
                rating: $0.roundedRating)
        }
    }
}
