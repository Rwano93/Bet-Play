import SwiftUI

struct GameTile: View {
    let title: String
    let systemImage: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 12) {
                Image(systemName: systemImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                    .foregroundStyle(.yellow)
                    .shadow(radius: 6)
                Text(title)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity, minHeight: 140)
            .padding()
            .background(.white.opacity(0.08))
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(.yellow.opacity(0.25), lineWidth: 1))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .black.opacity(0.4), radius: 8, x: 0, y: 4)
        }
    }
}
