import SwiftUI

struct MainMenuView: View {
    @EnvironmentObject var user: UserService
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.black, Color.red.opacity(0.85)],
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    TopBar(username: user.username,
                           avatar: user.avatar,
                           balanceText: "Solde: \(user.balance) €",
                           onSettings: { print("Ouvrir paramètres") })

                    HStack(spacing: 16) {
                        GameTile(title: "Blackjack", systemImage: "suit.club.fill") { print("Blackjack") }
                        GameTile(title: "Baccarat", systemImage: "suit.diamond.fill") { print("Baccarat") }
                    }
                    .padding(.horizontal)

                    HStack(spacing: 16) {
                        GameTile(title: "Roulette", systemImage: "circle.grid.cross") { print("Roulette") }
                        GameTile(title: "À venir", systemImage: "sparkles") { }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 24)
            }
        }
        .transition(.move(edge: .leading).combined(with: .opacity))
    }
}
