import SwiftUI

struct TopBar: View {
    let username: String
    let avatar: String
    let balanceText: String
    let onSettings: () -> Void

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: avatar)
                .resizable()
                .scaledToFit()
                .frame(width: 42, height: 42)
                .foregroundStyle(.yellow)
                .padding(8)
                .background(.white.opacity(0.08))
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 2) {
                Text(username.isEmpty ? "Joueur" : username)
                    .foregroundStyle(.white)
                    .font(.headline)
                Text(balanceText)
                    .foregroundStyle(.yellow)
                    .font(.subheadline)
            }
            Spacer()
            Button(action: onSettings) {
                Image(systemName: "gearshape.fill")
                    .font(.title3)
                    .foregroundStyle(.yellow)
                    .padding(10)
                    .background(.white.opacity(0.08))
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal)
    }
}
