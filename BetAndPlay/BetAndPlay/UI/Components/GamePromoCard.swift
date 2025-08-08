import SwiftUI

struct GamePromoCard: View {
    let title: String
    let subtitle: String
    let imageName: String
    let onRulesTap: () -> Void
    let onPlayTap: () -> Void

    var body: some View {
        GeometryReader { geo in
            let s = UISizing.scale(geo.size.width)
            ZStack {
                // Fond
                RoundedRectangle(cornerRadius: 18*s)
                    .fill(
                        LinearGradient(colors: [Color.black.opacity(0.55), Color.black.opacity(0.35)],
                                       startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 18*s)
                            .stroke(Color.blue.opacity(0.3), lineWidth: 1*s)
                    )
                    .shadow(color: .black.opacity(0.45), radius: 12*s, y: 8*s)

                // Contenu
                HStack {
                    VStack(alignment: .leading, spacing: 10*s) {
                        Text(title.uppercased())
                            .font(.system(size: 26*s, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)

                        Text(subtitle)
                            .font(.system(size: 14*s, weight: .medium, design: .rounded))
                            .foregroundColor(.white.opacity(0.85))
                            .lineLimit(2)

                        Spacer()

                        Button(action: onPlayTap) {
                            Text("JOUER")
                                .font(.system(size: 14*s, weight: .bold, design: .rounded))
                                .padding(.vertical, 8*s)
                                .padding(.horizontal, 16*s)
                                .background(
                                    LinearGradient(colors: [Color.purple, Color.blue],
                                                   startPoint: .leading, endPoint: .trailing)
                                )
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 12*s))
                                .shadow(color: .black.opacity(0.3), radius: 6*s, y: 3*s)
                        }
                    }
                    .padding(16*s)

                    Spacer(minLength: 10*s)

                    // Illustration à droite (débordant un peu = moderne)
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.38)
                        .offset(x: 8*s)
                        .clipped()
                }
                .padding(.trailing, 8*s)

                // Chip "Règles"
                HStack(spacing: 4*s) {
                    Image(systemName: "exclamationmark.circle.fill")
                        .font(.system(size: 12*s, weight: .bold))
                    Text("Règles")
                        .font(.system(size: 12*s, weight: .semibold))
                }
                .foregroundColor(.gray)
                .padding(.vertical, 5*s)
                .padding(.horizontal, 10*s)
                .background(Color.white.opacity(0.15))
                .clipShape(Capsule())
                .padding(10*s)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .contentShape(Rectangle())
                .onTapGesture { onRulesTap() }
            }
        }
        .frame(height: 210) // carte compacte
    }
}
