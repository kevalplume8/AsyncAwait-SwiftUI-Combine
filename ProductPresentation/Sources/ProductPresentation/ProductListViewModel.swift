import Foundation
import ProductDomain

public class ProductListViewModel: ObservableObject {
    @Published public var products: [ProductPresentationModel] = []
    @Published public var errorAlertModel: ErrorAlertModel?
    @Published public var isLoading: Bool = true

    private let getProductListUsecase: GetProductListUsecase
    private let productListDomainToPresentationModelMapper = ProductListDomainToPresentationModelMapper()
    public init(getProductListUsecase: GetProductListUsecase = GetProductListUsecaseImpl()) {
        self.getProductListUsecase = getProductListUsecase
    }
    
    public func getProducts()  {
        getData()
    }
    
    private func getData() {
        isLoading = true
        Task {
            do {
                let domainModel  = try await getProductListUsecase.execute()
                DispatchQueue.main.async {[weak self] in
                    guard let presentationModel = self?.productListDomainToPresentationModelMapper.map(domainModel: domainModel) else { return }
                    self?.products = presentationModel
                    self?.isLoading = false
                }
                
            }
            catch {
                DispatchQueue.main.async {[weak self] in
                    self?.errorAlertModel = ErrorAlertModel(title: "Error", message: error.localizedDescription)
                    self?.isLoading = false
                }
            }
        }
    }
}
