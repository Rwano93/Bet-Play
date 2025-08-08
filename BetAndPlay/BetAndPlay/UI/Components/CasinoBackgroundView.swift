import SwiftUI

struct CasinoBackgroundView: View {
    var dim: Double = 0.45   // assombrissement
    var gradient: Bool = true

    var body: some View {
        ZStack {
            Image("CasinoBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            if gradient {
                LinearGradient(
                    colors: [
                        Color.black.opacity(dim + 0.15),
                        Color.black.opacity(dim)
                    ],
                    startPoint: .top, endPoint: .bottom
                )
                .ignoresSafeArea()
            } else {
                Color.black.opacity(dim).ignoresSafeArea()
            }
        }
    }
}
