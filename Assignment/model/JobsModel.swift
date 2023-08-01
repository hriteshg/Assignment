import Foundation

struct JobsModel: Codable {
    let page, size, total: Int
    let hasNext: Bool
    let jobs: [JobModel]
}
