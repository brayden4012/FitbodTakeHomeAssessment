import Foundation

public protocol NetworkingService {
    var host: String { get }
    func get<Request: NetworkRequest>(_ request: Request) async throws -> (Data, URLResponse)
    // TODO: Implement remaining methods
}
