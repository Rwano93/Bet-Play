import SwiftUI

struct TopBar: View {
    let username: String
    let avatarImageName: String?  // nil -> SF Symbol par défaut
    let balanceText: String
    let onProfileTap: () -> Void
    let onSettingsTap: () -> Void

    var body: some View {
        // PAS de GeometryReader ici -> évite les décalages
        HStack(spacing: 12) {
            Button(action: onProfileTap) {
                HStack(spacing: 10) {
                    Group {
                        if let name = avatarImageName, !name.isEmpty, UIImage(named: name) != nil {
                            Image(name)
                                .resizable()
                                .scaledToFill()
                        } else {
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.white)
                        }
                    }
                    .frame(width: 42, height: 42)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white.opacity(0.9), lineWidth: 2))

                    // Solde proche du profil
                    Text(balanceText)
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Color.white.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }

            Spacer(minLength: 12)

            Button(action: onSettingsTap) {
                Image(systemName: "gearshape.fill")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.white.opacity(0.15))
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal, 16)   // ne touche jamais les bords
        .padding(.top, 6)
        .frame(maxWidth: .infinity, alignment: .center)
    }
}
