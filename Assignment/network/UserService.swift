import Foundation

class UserService {
    func fetchJobs(userId: Int, completion: @escaping (UserModel?, String?) -> Void) {
        NetworkManager.shared.getServiceData(url: "\(url)/user/\(userId)", method: .get, completion: completion)
    }
}
