import Foundation

class JobsService {
    func fetchJobs(page: Int, completion: @escaping (JobsModel?, String?) -> Void) {
        let params = ["page": page]
        NetworkManager.shared.getServiceData(url: "\(url)/jobs", method: .get, parameters: params, completion: completion)
    }
}
