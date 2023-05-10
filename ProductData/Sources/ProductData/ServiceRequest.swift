import Foundation

class ServiceRequest {
    static let shared = ServiceRequest()
    func getData<T: Codable>(from urlString: String, for model: T.Type) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NSError(domain: "Invalid url", code: 305, userInfo: nil)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
