import Foundation
import ProductData

public protocol GetProductListUsecase {
    func execute() async throws -> [ProductDomainModel]
}

public class GetProductListUsecaseImpl: GetProductListUsecase {
    private let productDataRepository: ProductDataRepository
    private let productListDataToDomainModelMapper = ProductListDataToDomainModelMapper()
    public init(productDataRepository: ProductDataRepository = ProductDataRepositoryImpl()) {
        self.productDataRepository = productDataRepository
    }
    public func execute() async throws -> [ProductDomainModel] {
        let domainModel = try await productDataRepository.get()
        return productListDataToDomainModelMapper.map(domainModel: domainModel)
    }
}

struct ProductListDataToDomainModelMapper {
    init () {}
    func map(domainModel: [ProductDataModel]) -> [ProductDomainModel] {
        domainModel.map {
            ProductDomainModel(name: $0.name,
                               tagline: $0.tagline,
                               rating: $0.rating,
                               date: $0.date)
        }
    }
}


