import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var user: UserService
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        GeometryReader { geo in
            let s = UISizing.scale(geo.size.width)
            ZStack {
                CasinoBackgroundView(dim: 0.55)

                VStack(spacing: 18*s) {
                    HStack {
                        Button {
                            withAnimation { viewRouter.currentPage = "menu" }
                        } label: {
                            HStack(spacing: 6*s) {
                                Image(systemName: "chevron.left")
                                Text("Retour")
                            }
                            .font(.system(size: 14*s, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(8*s)
                            .background(Color.white.opacity(0.15))
                            .clipShape(Capsule())
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 12*s)

                    if UIImage(named: user.avatar) != nil {
                        Image(user.avatar)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 110*s, height: 110*s)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.yellow, lineWidth: 3*s))
                            .shadow(radius: 8*s)
                    } else {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 110*s, height: 110*s)
                            .foregroundColor(.yellow)
                            .shadow(radius: 8*s)
                    }

                    Text(user.username.isEmpty ? "Joueur" : user.username)
                        .font(.system(size: 20*s, weight: .bold))
                        .foregroundColor(.white)

                    Text("Solde: \(user.balance) €")
                        .font(.system(size: 16*s, weight: .semibold))
                        .foregroundColor(.yellow)

                    Spacer()

                    Button {
                        user.logout()
                        withAnimation { viewRouter.currentPage = "login" }
                    } label: {
                        Text("Déconnexion")
                            .font(.system(size: 16*s, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 12*s)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 14*s))
                            .shadow(radius: 6*s)
                            .padding(.horizontal, 20*s)
                    }

                    Spacer(minLength: 12*s)
                }
            }
        }
    }
}
