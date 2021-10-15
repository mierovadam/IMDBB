import Foundation

struct Response: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let title: String?
    let release_date: String?
    let vote_average: Double?
    let poster_path: String?
    let overview: String?
}
