import Foundation

public enum OpenMeteoError: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case decodingError(Error)
}

public struct OpenMeteoOptions {
    public let baseURL: URL
    
    public init(baseURL: URL = URL(string: "https://api.open-meteo.com/v1")!) {
        self.baseURL = baseURL
    }
}

public class OpenMeteo {
    private let options: OpenMeteoOptions
    private let session: URLSession
    
    public init(options: OpenMeteoOptions = OpenMeteoOptions()) {
        self.options = options
        self.session = URLSession.shared
    }
    
    internal func fetch<T: Decodable>(_ endpoint: String, parameters: [String: Any]) async throws -> T {
        guard var components = URLComponents(url: options.baseURL.appendingPathComponent(endpoint), resolvingAgainstBaseURL: true) else {
            throw OpenMeteoError.invalidURL
        }
        
        components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        
        guard let url = components.url else {
            throw OpenMeteoError.invalidURL
        }
        
        do {
            let (data, response) = try await session.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw OpenMeteoError.invalidResponse
            }
            
            return try JSONDecoder().decode(T.self, from: data)
        } catch let error as DecodingError {
            throw OpenMeteoError.decodingError(error)
        } catch {
            throw OpenMeteoError.networkError(error)
        }
    }
} 