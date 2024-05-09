import SwiftUI

struct ContentView: View {
    @State private var isNavigateToArtistList = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.purple, Color.blue]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack {
                Spacer()

                Text("Tatapp")
                    .font(.custom("Snell Roundhand", size: 150))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Text("Your Ink,Your Way: Discover the Perfect Artist Today!")
                    .font(.custom("Snell Roundhand", size: 30))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(action: {
                    self.isNavigateToArtistList = true
                }) {
                    Text("Get Started")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.green)
                        )
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 2)
                )
                .sheet(isPresented: $isNavigateToArtistList) {
                    ArtistListView() 
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
