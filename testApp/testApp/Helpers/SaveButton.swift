

import SwiftUI

struct SaveButton: View {
    
    @Binding var isFavorite: Bool
    
    var body: some View {
        Button {
            isFavorite.toggle()
        } label: {
            Label("Toggle Saved", systemImage:
                    isFavorite ? "star.fill" : "star")
            .labelStyle(.iconOnly)
            .foregroundColor(isFavorite ? .yellow : .gray)
        }
    }
}

struct SaveButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveButton(isFavorite: .constant(true))
    }
}
