import SwiftUI
import ProductPresentation

public struct ProductListView: View {
    @StateObject private var viewModel = ProductListViewModel()
    public init() {}
    public var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.products, id: \.id) { product in
                    ProductCell(product: product)
                }
                .navigationTitle("Home")
                .onAppear{
                    viewModel.getProducts()
                }
                if viewModel.isLoading { LoadingView() }
            }
            .alert(item: $viewModel.errorAlertModel) { alertModel in
                Alert(title: Text(alertModel.title), message: Text(alertModel.message))
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
