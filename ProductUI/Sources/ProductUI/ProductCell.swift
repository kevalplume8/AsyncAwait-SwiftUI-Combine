import SwiftUI
import ProductPresentation

struct ProductCell: View {
    private let product: ProductPresentationModel
    init(product: ProductPresentationModel) {
        self.product = product
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                Text(product.name)
                    .font(.title)
                    .fontWeight(.medium)
                Spacer()
                Text(product.formattedRating)
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .padding(.trailing, 5)
            }
            
            HStack(alignment: .firstTextBaseline) {
                Text(product.tagline)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .fontWeight(.semibold)
            }
        }
    }
}
