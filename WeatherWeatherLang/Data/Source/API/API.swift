import Foundation

public enum APIError: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case decodingError(Error)
}

public enum APIVersion {
    public static let number = 1
}

public struct APIOptions {
    public let baseURL: URL

    public init(baseURL: URL = URL(string: "https://api.open-meteo.com/v\(APIVersion.number)")!) {
        self.baseURL = baseURL
    }
}

struct API {
    private let options: APIOptions
    private let session: URLSession

    init(options: APIOptions = APIOptions()) {
        self.options = options
        session = URLSession.shared
    }

    func fetch<T: Decodable>(_ endpoint: String, parameters: Encodable) async throws -> T {
        guard var components = URLComponents(url: options.baseURL.appendingPathComponent(endpoint),
                                             resolvingAgainstBaseURL: true)
        else {
            throw APIError.invalidURL
        }

        let jsonEncoder = JSONEncoder()
        let jsonData = try jsonEncoder.encode(parameters)
        let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
        components.queryItems = json!.map { URLQueryItem(name: $0.key, value: "\($0.value)") }

        guard let url = components.url else {
            throw APIError.invalidURL
        }

        do {
            let (data, response) = try await session.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse,
                  (200 ... 299).contains(httpResponse.statusCode)
            else {
                throw APIError.invalidResponse
            }
            // check if running in debug mode
            if _isDebugAssertConfiguration() {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    print(json ?? "")
                } catch {
                    print("errorMsg")
                }
            }
            return try JSONDecoder().decode(T.self, from: data)
        } catch let error as DecodingError {
            throw APIError.decodingError(error)
        } catch {
            throw APIError.networkError(error)
        }
    }
}
