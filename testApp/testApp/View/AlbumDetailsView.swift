

import SwiftUI

struct AlbumDetailsView: View {
    
    @StateObject var viewModel = AlbumListViewModel()
    
    var album: Album
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: album.image.first?.text ?? ""))
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.black, lineWidth: 1)
                    }
                
                Text(album.name)
                    .font(.title)
                    .fontWeight(.heavy)
            }
            Spacer()
            
            HStack {
                
                Text(album.artist)
                    .fontWeight(.bold)
                    
                    
            }
            
           
        
            List (viewModel.tracks, id: \.self){ track in
                Text(track.name)
                    .italic()
            }
        }
        .onAppear(perform: {
            viewModel.fetchAlbumDetails(album: album)
        })
    }
}

//struct AlbumDetailsView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        AlbumDetailsView(album: Album(id: 1, name:  ))
//    }
//}

