

import Foundation

// MARK: - Albums
struct Albums: Codable {
    let results: AlbumResult

    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}

// MARK: - Results
struct AlbumResult: Codable {
    let opensearchQuery: OpensearchQuery
    let opensearchTotalResults: String
    let opensearchStartIndex: String
    let opensearchItemsPerPage: String
    let albummatches: Albummatches
    let attr: Attr

    enum CodingKeys: String, CodingKey {
        case opensearchQuery = "opensearch:Query"
        case opensearchTotalResults = "opensearch:totalResults"
        case opensearchStartIndex = "opensearch:startIndex"
        case opensearchItemsPerPage = "opensearch:itemsPerPage"
        case albummatches = "albummatches"
        case attr = "@attr"
    }
}

// MARK: - Albummatches
struct Albummatches: Codable {
    let album: [Album]

    enum CodingKeys: String, CodingKey {
        case album = "album"
    }
}

// MARK: - Album
struct Album: Codable, Hashable, Identifiable {
   
    
    
    let id = UUID()
    let name: String
    let artist: String
    let url: String
    let image: [Image]
    let streamable: String
    let mbid: String
    var isFavorite: Bool?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case artist = "artist"
        case url = "url"
        case image = "image"
        case streamable = "streamable"
        case mbid = "mbid"
        
    }
    
    static func == (lhs: Album, rhs: Album) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Image
struct Image: Codable {
    let text: String
    let size: Size

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case size = "size"
    }
}

enum Size: String, Codable {
    case extralarge = "extralarge"
    case large = "large"
    case medium = "medium"
    case small = "small"
}

// MARK: - Attr
struct Attr: Codable {
    let attrFor: String

    enum CodingKeys: String, CodingKey {
        case attrFor = "for"
    }
}

// MARK: - OpensearchQuery
struct OpensearchQuery: Codable {
    let text: String
    let role: String
    let searchTerms: String
    let startPage: String

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case role = "role"
        case searchTerms = "searchTerms"
        case startPage = "startPage"
    }
}
