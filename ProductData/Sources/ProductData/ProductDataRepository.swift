import Foundation

public protocol ProductDataRepository {
    func get() async throws -> [ProductDataModel]
}
public struct ProductDataRepositoryImpl: ProductDataRepository {
    private let productDataUrl = "https://api.wayfair.io/interview-sandbox/android/json-to-list/products.v1.json"
    public init() {}
    
    public func get() async throws -> [ProductDataModel] {
       return try await ServiceRequest.shared.getData(from: productDataUrl, for: [ProductDataModel].self)
    }
}

