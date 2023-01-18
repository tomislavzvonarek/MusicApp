

import Foundation
import Combine

class AlbumListViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var albums: [Album] = [Album]()
    @Published var tracks: [Track] = []
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        $searchTerm
            .dropFirst()
            .sink {[weak self] term in
            self?.fetchAlbums(for: term)
        }.store(in: &subscriptions)
    }
    
    //func for fetching album details from API
    
    func fetchAlbumDetails(album: Album) {
        let apiKey = "api_key=8d78361009bc745b7ede256e14ecdca2"
        let method = "method=album.getinfo"
        let format = "format=json"
        let albumPath = "album=\(album.name)".replacingOccurrences(of: " ", with: "%20")
        let artist = "artist=\(album.artist)".replacingOccurrences(of: " ", with: "%20")
        guard let url = URL(string:  "https://ws.audioscrobbler.com/2.0/?\(apiKey)&\(method)&\(format)&\(albumPath)&\(artist)") else {
            return
        }
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print("urlSession error: \(error.localizedDescription)")
            } else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(AlbumDetailsResult.self, from: data)
                    DispatchQueue.main.async {
                        self.tracks = result.albumDetails.tracks.track
                    }
                } catch {
                    print("decoding error \(error)")
                }
            }
        }
        .resume()
    }
    
    //func for fetching albums from API for search terms
    
    func fetchAlbums(for searchTerm: String) {
        
        guard !searchTerm.isEmpty else {
            return
        }
        
        let apiKey = "api_key=8d78361009bc745b7ede256e14ecdca2"
        let method = "method=album.search"
        let format = "format=json"
        let album = "album=\(searchTerm)"
        guard let url = URL(string:  "https://ws.audioscrobbler.com/2.0/?\(apiKey)&\(method)&\(format)&\(album)") else {
            return
        }
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print("urlSession error: \(error.localizedDescription)")
            } else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(Albums.self, from: data)
                    DispatchQueue.main.async {
                        self.albums = result.results.albummatches.album
                    }
                } catch {
                    print("decoding error \(error)")
                }
            }
        }
        .resume()
        
    }
    
}
