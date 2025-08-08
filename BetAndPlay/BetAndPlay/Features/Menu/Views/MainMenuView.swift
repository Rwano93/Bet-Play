import SwiftUI

struct MainMenuView: View {
    @EnvironmentObject var user: UserService
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        GeometryReader { geo in
            let s = UISizing.scale(geo.size.width)
            let cardWidth = min(geo.size.width * 0.86, 380)
            let cardHeight = cardWidth * 0.72

            ZStack {
                CasinoBackgroundView(dim: 0.35)

                VStack {
                    // ── TOP BAR (rien ne touche les bords, centré visuellement)
                    TopBar(
                        username: user.username.isEmpty ? "Guest" : user.username,
                        avatarImageName: user.avatar == "person.circle" ? nil : user.avatar,
                        balanceText: "Solde: \(user.balance) €",
                        onProfileTap: { withAnimation { viewRouter.currentPage = "profile" } },
                        onSettingsTap: { withAnimation { viewRouter.currentPage = "settings" } }
                    )
                    .frame(maxWidth: .infinity)
                    .padding(.top, 4*s)
                    
                    Spacer() // Pousse le contenu vers le bas

                    // ── SWIPE PAGINÉ DES JEUX
                    TabView {
                        ForEach(GameModel.allGames) { game in
                            GameCard(game: game, width: cardWidth, height: cardHeight, s: s) {
                                // navigation vers la page du jeu
                                viewRouter.currentPage = game.page
                            }
                            .frame(width: geo.size.width) // centre réellement la carte
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .always))
                    .frame(height: cardHeight + 36*s) // place aux dots + espace

                    Spacer() // Pousse le contenu vers le haut
                }
            }
        }
    }
}

// ── CARD JEU ────────────────────────────────────────────────────────────────
struct GameCard: View {
    let game: GameModel
    let width: CGFloat
    let height: CGFloat
    let s: CGFloat
    let onPlay: () -> Void

    var body: some View {
        VStack(spacing: 12*s) {
            HStack(alignment: .center, spacing: 12*s) {
                // Image réduite (côté gauche)
                Image(game.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: width * 0.32, height: width * 0.32)

                VStack(alignment: .leading, spacing: 6*s) {
                    Text(game.title.uppercased())
                        .font(.system(size: 18*s, weight: .bold))
                        .foregroundColor(.white)

                    Text(game.subtitle)
                        .font(.system(size: 14*s))
                        .foregroundColor(.white.opacity(0.85))
                        .lineLimit(2)

                    Spacer(minLength: 0)

                    Button(action: onPlay) {
                        Text("JOUER")
                            .font(.system(size: 15*s, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10*s)
                            .background(
                                LinearGradient(colors: [.purple, .blue],
                                               startPoint: .leading, endPoint: .trailing)
                            )
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12*s))
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(14*s)
        }
        .frame(width: width, height: height)
        .background(Color.white.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 16*s))
        .shadow(color: .black.opacity(0.35), radius: 8*s, y: 4*s)
        .padding(.horizontal, 0) // largeur déjà gérée
        .frame(maxWidth: .infinity, alignment: .center) // centre la carte dans la page
    }
}

// ── MODÈLE DES JEUX ─────────────────────────────────────────────────────────
struct GameModel: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
    let page: String

    static let allGames: [GameModel] = [
        GameModel(title: "Baccarat",
                  subtitle: "Parie sur Joueur, Banquier ou Égalité.",
                  imageName: "baccarat_img",
                  page: "baccarat"),
        GameModel(title: "Blackjack",
                  subtitle: "Affronte le croupier pour atteindre 21.",
                  imageName: "blackjack_img",
                  page: "blackjack"),
        GameModel(title: "Roulette",
                  subtitle: "Mise sur numéros, colonnes ou couleurs.",
                  imageName: "roulette_img",
                  page: "roulette"),
        GameModel(title: "À venir",
                  subtitle: "De nouveaux jeux arrivent bientôt.",
                  imageName: "comingsoon",
                  page: "comingSoon")
    ]
}
