import Foundation

public struct ErrorAlertModel: Identifiable {
    public let id: UUID = UUID()
    public let title: String
    public let message: String
}
