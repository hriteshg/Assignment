import Foundation

struct JobModel: Codable {
    let salaryRange: SalaryRangeModel
    let id, positionTitle, description: String
    let company: CompanyModel
    let location, industry, status: Int
    let createdAt, updatedAt: String
    let v: Int
    let haveIApplied: Bool
    
    enum CodingKeys: String, CodingKey {
        case salaryRange
        case id = "_id"
        case positionTitle, description, company, location, industry, status, createdAt, updatedAt
        case v = "__v"
        case haveIApplied
    }
}
