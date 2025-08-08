// BetAndPlay/BetAndPlay/Features/Menu/Views/MainMenuView.swift
import SwiftUI

struct MainMenuView: View {
    @EnvironmentObject var user: UserService
    @EnvironmentObject var viewRouter: ViewRouter

    let games: [Game] = [
        .init(title: "Blackjack",
              subtitle: "Atteins 21 sans dépasser. Joue contre le croupier.",
              imageName: "blackjack",
              rules: "Le Blackjack est un jeu de cartes..."),
        .init(title: "Baccarat",
              subtitle: "Parie sur Joueur, Banquier ou Égalité.",
              imageName: "baccarat",
              rules: "Le Baccarat se joue en misant..."),
        .init(title: "Roulette",
              subtitle: "Mise sur un numéro, une couleur ou une combinaison.",
              imageName: "roulette",
              rules: "La Roulette consiste à miser..."),
        .init(title: "À venir",
              subtitle: "Nouveaux jeux bientôt disponibles.",
              imageName: "comingsoon",
              rules: "Bientôt.")
    ]

    var body: some View {
        GeometryReader { geo in
            let s = UISizing.scale(geo.size.width)
            ZStack {
                CasinoBackgroundView(dim: 0.5)

                VStack(spacing: 18*s) {
                    TopBar(
                        username: user.username,
                        avatarImageName: user.avatar,
                        balanceText: "Solde: \(user.balance) €",
                        onProfileTap: { withAnimation { viewRouter.currentPage = "profile" } }
                    )
                    .padding(.top, 6*s)

                    TabView {
                        ForEach(games) { game in
                            GamePromoCard(
                                title: game.title,
                                subtitle: game.subtitle,
                                imageName: game.imageName,
                                onRulesTap: {
                                    viewRouter.selectedGame = game
                                    withAnimation { viewRouter.currentPage = "gameDetail" }
                                },
                                onPlayTap: {
                                    print("\(game.title) lancé")
                                }
                            )
                            .padding(.horizontal, 20*s)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .frame(height: 230)

                    Spacer()
                }
                .padding(.bottom, 6*s)
            }
        }
    }
}
