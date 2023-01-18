

import SwiftUI

struct AlbumListView: View {
    
    @StateObject var viewModel = AlbumListViewModel()
    
    var body: some View {
        NavigationView{
            List(viewModel.albums, id: \.self) {album in
                ForEach(viewModel.albums) { album in
                    NavigationLink {
                        AlbumDetailsView(album: album)
                    } label: {
                        Text(album.name)
                    }
                }
            }
            .listStyle(.plain)
            .searchable(text: $viewModel.searchTerm)
            .navigationTitle("Search Albums")
            .onAppear {
                viewModel.fetchAlbums(for: viewModel.searchTerm)
            }
        }
    }
    
    struct AlbumListView_Previews: PreviewProvider {
        static var previews: some View {
            AlbumListView()
        }
    }
}
