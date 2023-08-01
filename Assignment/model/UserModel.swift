import Foundation

struct UserModel: Codable {
    let id, username, password, displayname: String
    let createdAt, updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case username, password, displayname, createdAt, updatedAt
        case v = "__v"
    }
}
