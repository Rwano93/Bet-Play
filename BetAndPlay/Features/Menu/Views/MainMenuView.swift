import SwiftUI
struct MainMenuView: View {
    @EnvironmentObject var wallet: WalletService
    @EnvironmentObject var user: UserService
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    Image(user.avatar)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text(user.username)
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("Solde: \(wallet.balance) €")
                            .foregroundColor(.gold)
                    }
                    Spacer()
                }
                .padding()
                gameTile(title: "Blackjack", image: "blackjack")
                gameTile(title: "Baccarat", image: "baccarat")
                gameTile(title: "Roulette", image: "roulette")
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
    }
    private func gameTile(title: String, image: String) -> some View {
        Button {
            print("Ouvrir \(title)")
        } label: {
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                Text(title)
                    .foregroundColor(.white)
                    .font(.headline)
            }
            .padding()
            .background(Color.casinoGreen)
            .cornerRadius(15)
            .shadow(radius: 5)
        }
    }
}
