//
//  NetworkService.swift
//  FitbodTakeHomeAssessment
//
//  Created by Brayden Harris on 6/16/24.
//

import Foundation
import Networking

final class NetworkService: NetworkingService {
    var host: String {
        "https://api.fitbod.com"
    }
    
    func get<Request: NetworkRequest>(_ request: Request) async throws -> (Data, URLResponse) {
        var comps = URLComponents()
        comps.host = host
        comps.path = request.endpoint
        guard let url = comps.url else { throw NetworkingError.badURL }
        let request = URLRequest(url: url)
        return try await URLSession.shared.data(for: request)
    }
}
