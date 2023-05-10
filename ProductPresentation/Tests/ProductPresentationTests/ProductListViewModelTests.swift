import XCTest
import Combine
@testable import ProductPresentation
@testable import ProductDomain

final class ProductListViewModelTests: XCTestCase {
    var getProductListUsecase: GetProductListUsecase!
    var productViewModel: ProductListViewModel!
    var cancellable: AnyCancellable?
    
    override func setUpWithError() throws {
        getProductListUsecase = MockGetProductListUsecase(responseType: .success)
    }
    
    func test_isLoading() throws {
        productViewModel = ProductListViewModel(getProductListUsecase: getProductListUsecase)
        let expectation = XCTestExpectation(description: "Publishes isLoading")
        
        cancellable = productViewModel.$isLoading
            .sink(receiveValue: { isLoading in
                XCTAssertTrue(isLoading)
                expectation.fulfill()
            })
        wait(for: [expectation], timeout: 1)
    }
    
    func test_products() {
        productViewModel = ProductListViewModel(getProductListUsecase: getProductListUsecase)
        productViewModel.getProducts()
        let expectation = XCTestExpectation(description: "Publishes products")
        
        cancellable = productViewModel.$products
            .dropFirst()
            .sink(receiveValue: { product in
                XCTAssertEqual(product[0].name, MockProductPresentationData.products[0].name)
                XCTAssertEqual(product[0].tagline, MockProductPresentationData.products[0].tagline)
                XCTAssertEqual(product[0].rating, MockProductPresentationData.products[0].rating)
                expectation.fulfill()
            })
        wait(for: [expectation], timeout: 1)
        
    }
    
    func test_ErrorAlertModel() {
        getProductListUsecase = MockGetProductListUsecase(responseType: .failure)
        productViewModel = ProductListViewModel(getProductListUsecase: getProductListUsecase)
        productViewModel.getProducts()
        let expectation = XCTestExpectation(description: "Publishes errorAlertModel")
        
        cancellable = productViewModel
            .$errorAlertModel
            .dropFirst()
            .sink(receiveValue: { errorModel in
                XCTAssert(((errorModel?.title) != nil), "Error")
                XCTAssert(((errorModel?.message) != nil), "Invalid url error 323.")
                expectation.fulfill()
            })
        wait(for: [expectation], timeout: 1)
        
    }
    
    func test_productListDomainToPresentationModelMapper() {
        let input = ProductListDomainToPresentationModelMapper().map(domainModel: MockProductDomainData.products)
        let expected = MockProductPresentationData.products
        print(input)
        print(expected)
        XCTAssertEqual(input[0].name, expected[0].name)
        XCTAssertEqual(input[0].formattedRating, expected[0].formattedRating)
        XCTAssertEqual(input[0].tagline, expected[0].tagline)
    }
}
