import Foundation
@testable import ProductPresentation
@testable import ProductDomain

struct MockGetProductListUsecase: GetProductListUsecase {
    let responseType: ResponseType
    enum ResponseType {
        case success
        case failure
    }
    init(responseType: ResponseType) {
        self.responseType = responseType
    }
    func execute() async throws -> [ProductDomain.ProductDomainModel] {
        switch responseType {
        case .success:
            return MockProductDomainData.products
        case .failure:
            throw NSError(domain: "Invalid url", code: 323)
        }
    }
}
