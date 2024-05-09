import SwiftUI

struct ArtistDetailsView: View {
    let artist: TattooArtist
    @State private var isAppointmentConfirmed = false

    var body: some View {
        VStack {
            Text("Artist Details")
                .font(.largeTitle)
            Text("Name: \(artist.name)")
            Text("Distance: \(String(format: "%.1f", artist.distance)) miles away")
            Text("Style: \(artist.style)")
            Text("Price: $\(String(format: "%.2f", artist.price))")
            Text("Rating: \(String(format: "%.1f", artist.rating))")
            Text("Location: \(artist.location)")
            Text("Contact Info: \(artist.contactInfo)")
            Button(action: {
                self.isAppointmentConfirmed.toggle()
            }) {
                Text("Book Appointment")
            }
            .padding()
        }
        .alert(isPresented: $isAppointmentConfirmed) {
            Alert(
                title: Text("Appointment Confirmation"),
                message: Text("Your appointment with \(artist.name) is fixed!"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
