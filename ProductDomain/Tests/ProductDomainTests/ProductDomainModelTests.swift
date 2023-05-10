import XCTest
@testable import ProductDomain

final class ProductDomainModelTests: XCTestCase {
    func test_roundedRating() throws {
        XCTAssertEqual(MockProductDomainData.chair.roundedRating, "4.0")
        XCTAssertEqual(MockProductDomainData.stool.roundedRating, "4.0")
        XCTAssertEqual(MockProductDomainData.table.roundedRating, "2.5")
    }
}
