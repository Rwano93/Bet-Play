import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var user: UserService
    @EnvironmentObject var viewRouter: ViewRouter

    private var hasCustomAvatar: Bool {
        !user.avatar.isEmpty && UIImage(named: user.avatar) != nil
    }

    var body: some View {
        ZStack {
            CasinoBackgroundView(dim: 0.6)

            VStack(spacing: 24) {
                // Avatar
                if hasCustomAvatar {
                    Image(user.avatar)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.yellow, lineWidth: 3))
                        .shadow(radius: 8)
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundStyle(.yellow)
                        .shadow(radius: 8)
                }

                // Username
                Text(user.username.isEmpty ? "Joueur" : user.username)
                    .font(.title2)
                    .foregroundStyle(.white)

                // Solde
                Text("Solde: \(user.balance) €")
                    .font(.headline)
                    .foregroundStyle(.yellow)

                Spacer()

                // Bouton déconnexion
                Button(action: {
                    user.logout()
                    withAnimation {
                        viewRouter.currentPage = "login"
                    }
                }) {
                    Text("Déconnexion")
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .foregroundStyle(.white)
                        .cornerRadius(14)
                        .shadow(radius: 6)
                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                        
                        .background(
                            LinearGradient(colors: [Color.red, Color.orange],
                                           startPoint: .leading, endPoint: .trailing)
                        )
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: .black.opacity(0.35), radius: 10, y: 6)
                }
                .padding(.horizontal, 30)
            }
            .padding(.top, 80)
        }
        .overlay(alignment: .topLeading) {
            Button(action: {
                withAnimation {
                    viewRouter.currentPage = "menu"
                }
            }) {
                HStack(spacing: 6) {
                    Image(systemName: "chevron.left")
                    Text("Retour")
                        .font(.subheadline)
                }
                .padding(.horizontal, 12) // plus d’espace à gauche/droite
                .padding(.vertical, 8)
                .background(Color.white.opacity(0.15))
                .clipShape(Capsule())
                .foregroundStyle(.white)
            }
            .padding(.leading, 70) // décale du bord gauche
            .padding(.top, 12) // garde un espace en haut
        }
    }
}
