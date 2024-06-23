import Foundation
import UIKit
import Alamofire

class HTTP {
    let baseURL = "https://api.themoviedb.org/3"
    let apiKey = ApiKey.apiKey

    func getRequest<T: Decodable>(endpoint: String, parameters: [String: Any]? = nil, responseType: T.Type = T.self, view: UIView ,completion: @escaping (Result<T, Error>) -> Void) {
        let url = "\(baseURL)\(endpoint)?api_key=\(apiKey)"
        print("Request URL: \(url)")
        
        LoadingView.shared.showLoadingView(on: view)

        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: responseType) { response in
                LoadingView.shared.hideLoadingView()

                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    if let data = response.data {
                        do {
                            let json = try JSONSerialization.jsonObject(with: data, options: [])
                            let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                            if let formattedJsonString = String(data: jsonData, encoding: .utf8) {
                                print("Error JSON: \(formattedJsonString)")
                            }
                        } catch {
                            print("Error formateando el JSON: \(error.localizedDescription)")
                        }
                    }
                    print("Error: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
    }
}
