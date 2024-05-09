import SwiftUI

struct FilterSheet: View {
    @Binding var selectedFilter: ArtistListView.Filter

    var body: some View {
        VStack {
            Picker("Filter By", selection: $selectedFilter) {
                Text("Distance").tag(ArtistListView.Filter.distance)
                Text("Style").tag(ArtistListView.Filter.style)
                Text("Price").tag(ArtistListView.Filter.price)
                Text("Rating").tag(ArtistListView.Filter.rating)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
        }
    }
}
