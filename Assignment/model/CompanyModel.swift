import Foundation

struct CompanyModel: Codable {
    let id, name, createdAt, updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, createdAt, updatedAt
    }
}
