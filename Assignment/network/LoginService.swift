import Foundation

class LoginService {
    func login(username: String, password: String, completion: @escaping (String?, String?) -> Void) {
        let params = ["user": username, "password": password]
        NetworkManager.shared.getServiceData(url: "\(url)/auth", method: .post, parameters: params, completion: completion)
    }
}
