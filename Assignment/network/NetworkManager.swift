import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    let connectivityManager = NetworkReachabilityManager()
    let manager = Alamofire.Session.default
    
    func getServiceData <T: Codable> (url: String, method: HTTPMethod, parameters: [String:Any]? = nil, encodingType: ParameterEncoding = URLEncoding.default, headers: HTTPHeaders? = nil, completion: @escaping (T?, String?) ->()) {
        if connectivityManager?.isReachable ?? false {
            manager.session.configuration.timeoutIntervalForRequest = 20
            manager.request(url, method: method, parameters: parameters, encoding: encodingType, headers: headers)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: T.self) { (response) in
                if response.error != nil {
                    if let data = response.data {
                        completion(nil, String(data: data, encoding: .utf8))
                        return
                    }
                    completion(nil, response.error?.localizedDescription)
                }
                else {
                    completion(response.value, nil)
                }
            }
        }
        else {
            completion(nil, "Network Not Reachable")
        }
    }
}
