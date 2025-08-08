import SwiftUI

struct CasinoBackgroundView: View {
    var dim: Double = 0.45
    var body: some View {
        Image("CasinoBackground")
            .resizable()
            .scaledToFill()
            .overlay(Color.black.opacity(dim))
            .ignoresSafeArea()
    }
}
