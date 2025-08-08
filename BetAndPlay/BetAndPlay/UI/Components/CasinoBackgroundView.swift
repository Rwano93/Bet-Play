import SwiftUI

struct CasinoBackgroundView: View {
    var dim: Double = 0.35 // opacité de l’assombrissement

    var body: some View {
        Image("CasinoBackground")
            .resizable()
            .scaledToFill()
            .overlay(Color.black.opacity(dim))
            .ignoresSafeArea()
    }
}
