import SwiftUI

struct TattooArtist: Identifiable {
    let id = UUID()
    let name: String
    let distance: Double
    let style: String
    let price: Double
    let rating: Double
    let location: String
    let contactInfo: String
}

struct ArtistListView: View {
    @State private var artists: [TattooArtist] = [
        TattooArtist(name: "Spencer Razinger", distance: 2.5, style: "Gothic Realism", price: 100, rating: 4.5, location: "Tattoo Studio A", contactInfo: "Email: @Raztattoos@gmail.com"),
                TattooArtist(name: "Richard Hammond", distance: 3.1, style: "Realism", price: 150, rating: 4.9, location: "Tattoo Studio B", contactInfo: "Email: @HammondInks@gmail.com"),
                TattooArtist(name: "James May", distance: 4.0, style: "Minimalist", price: 80, rating: 4.0, location: "Tattoo Studio C", contactInfo: "Email: @JamesMayInkWorld@icloud.com"),
                TattooArtist(name: "Vin Diesel", distance: 1.8, style: "Fine Line", price: 120, rating: 4.7, location: "Tattoo Studio D", contactInfo: "Email: @DieselTatts@icloud.com"),
                TattooArtist(name: "Katherine Musk", distance: 5.5, style: "Neo-Traditional", price: 130, rating: 4.3, location: "Tattoo Studio E", contactInfo: "Email: @KatsTatts@gmail.com"),
                TattooArtist(name: "Geoff Curry", distance: 5.5, style: "Tribal", price: 130, rating: 4.3, location: "Tattoo Studio E", contactInfo: "Email: K@InkMasterGeoff@icloud.com"),
                TattooArtist(name: "Hayley Williams", distance: 5.5, style: "Realism", price: 130, rating: 4.3, location: "Tattoo Studio E", contactInfo: "Email: @InkRockstar@gmail.com"),
                TattooArtist(name: "Lily Pizazz", distance: 5.5, style: "Neo-Traditional", price: 130, rating: 4.3, location: "Tattoo Studio F", contactInfo: "Email: @inkwithLily@icloud.com")
    ]

    @State private var isFilterSheetVisible = false
    @State private var selectedFilter: Filter = .distance
    @State private var selectedArtist: TattooArtist?

    enum Filter {
        case distance
        case style
        case price
        case rating
    }

    var filteredArtists: [TattooArtist] {
        switch selectedFilter {
        case .distance:
            return artists.sorted { $0.distance < $1.distance }
        case .style:
            return artists.sorted { $0.style < $1.style }
        case .price:
            return artists.sorted { $0.price < $1.price }
        case .rating:
            return artists.sorted { $0.rating > $1.rating }
        }
    }

    var body: some View {
        ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [Color.purple, Color.blue]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()

                    VStack {
                        HStack {
                            Button(action: {
                                print("Open Apple Maps")
                            }) {
                                Image(systemName: "map.fill")
                            }
                            Spacer()
                            Button(action: {
                                print("Go back to home page")
                            }) {
                                Image(systemName: "arrow.left.circle.fill")
                            }
                            Spacer()
                            Button(action: {
                                self.isFilterSheetVisible.toggle()
                            }) {
                                Image(systemName: "line.horizontal.3.decrease.circle.fill")
                            }
                        }
                        .font(.title)
                        .padding()

                        List(filteredArtists) { artist in
                            Button(action: {
                                self.selectedArtist = artist
                            }) {
                                HStack {
                                    Text(artist.name)
                                        .font(.custom("Snell Roundhand", size: 24))
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("\(String(format: "%.1f", artist.distance)) miles away")
                                        .font(.custom("Snell Roundhand", size: 20))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                }
                .sheet(isPresented: $isFilterSheetVisible) {
                    FilterSheet(selectedFilter: $selectedFilter)
                }
                .sheet(item: $selectedArtist) { artist in
                    ArtistDetailsView(artist: artist)
                }
            }
        }
    
struct ArtistListView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistListView()
    }
}
