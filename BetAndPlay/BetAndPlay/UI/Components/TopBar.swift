import SwiftUI

struct TopBar: View {
    let username: String
    let avatarImageName: String?   // nom image Assets (ex: "avatar1"), sinon nil => icône système
    let balanceText: String
    let onProfileTap: () -> Void

    var body: some View {
        GeometryReader { geo in
            let s = UISizing.scale(geo.size.width)
            HStack(spacing: 12 * s) {
                Button(action: onProfileTap) {
                    if let name = avatarImageName, !name.isEmpty, UIImage(named: name) != nil {
                        Image(name)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32*s, height: 32*s)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.yellow, lineWidth: 1.5*s))
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32*s, height: 32*s)
                            .foregroundColor(.yellow)
                    }
                }

                VStack(alignment: .leading, spacing: 2*s) {
                    Text(username.isEmpty ? "Joueur" : username)
                        .font(.system(size: 14*s, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                    Text(balanceText)
                        .font(.system(size: 11*s, weight: .medium, design: .rounded))
                        .foregroundColor(.yellow.opacity(0.9))
                }

                Spacer()

                Button(action: onProfileTap) {
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 16*s, weight: .bold))
                        .foregroundColor(.yellow)
                        .padding(6*s)
                        .background(Color.black.opacity(0.28))
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal, 14*s)
            .padding(.vertical, 6*s)
            .frame(maxWidth: 600, alignment: .center)
            .background(
                LinearGradient(colors: [Color.black.opacity(0.9), Color.black.opacity(0.7)],
                               startPoint: .top, endPoint: .bottom)
                    .clipShape(RoundedRectangle(cornerRadius: 12*s))
            )
            .shadow(color: .black.opacity(0.35), radius: 6*s, y: 4*s)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal, 12*s) // évite de toucher les bords
        }
        .frame(height: 52) // hauteur fixe compacte
    }
}
