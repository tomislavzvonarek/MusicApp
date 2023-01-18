

import Foundation

// MARK: - AlbumDetails
struct AlbumDetailsResult: Codable {
    let albumDetails: AlbumDetails

    enum CodingKeys: String, CodingKey {
        case albumDetails = "album"
    }
}

// MARK: - Album
struct AlbumDetails: Codable {
    let artist: String
    let mbid: String
    let tags: AlbumTags
    let playcount: String
    let image: [AlbumImage]
    let tracks: Tracks
    let url: String
    let name: String
    let listeners: String
    let wiki: Wiki

    enum CodingKeys: String, CodingKey {
        case artist = "artist"
        case mbid = "mbid"
        case tags = "tags"
        case playcount = "playcount"
        case image = "image"
        case tracks = "tracks"
        case url = "url"
        case name = "name"
        case listeners = "listeners"
        case wiki = "wiki"
    }
}

// MARK: - Image
struct AlbumImage: Codable {
    let size: String
    let text: String

    enum CodingKeys: String, CodingKey {
        case size = "size"
        case text = "#text"
    }
}

// MARK: - Tags
struct AlbumTags: Codable {
    let tag: [AlbumTag]

    enum CodingKeys: String, CodingKey {
        case tag = "tag"
    }
}

// MARK: - Tag
struct AlbumTag: Codable {
    let url: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case name = "name"
    }
}

// MARK: - Tracks
struct Tracks: Codable {
    let track: [Track]

    enum CodingKeys: String, CodingKey {
        case track = "track"
    }
}

// MARK: - Track
struct Track: Codable, Hashable, Identifiable {
    
    let id = UUID()
    let streamable: Streamable
    let duration: Int
    let url: String
    let name: String
    let artist: ArtistClass

    enum CodingKeys: String, CodingKey {
        case streamable = "streamable"
        case duration = "duration"
        case url = "url"
        case name = "name"
        case artist = "artist"
    }
    static func == (lhs: Track, rhs: Track) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - ArtistClass
struct ArtistClass: Codable {
    let url: String
    let name: String
    let mbid: String

    enum CodingKeys: String, CodingKey {
        case url = "url"
        case name = "name"
        case mbid = "mbid"
    }
}

// MARK: - Streamable
struct Streamable: Codable {
    let fulltrack: String
    let text: String

    enum CodingKeys: String, CodingKey {
        case fulltrack = "fulltrack"
        case text = "#text"
    }
}

// MARK: - Wiki
struct Wiki: Codable {
    let published: String
    let summary: String
    let content: String

    enum CodingKeys: String, CodingKey {
        case published = "published"
        case summary = "summary"
        case content = "content"
    }
}

