import SwiftUI

struct MainMenuView: View {
    @EnvironmentObject var wallet: WalletService
    @EnvironmentObject var user: UserService
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Profil
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
                            .foregroundColor(.yellow)
                    }
                    Spacer()
                }
                .padding()
                
                // Boutons des jeux
                gameButton(title: "Blackjack", imageName: "blackjack")
                gameButton(title: "Baccarat", imageName: "baccarat")
                gameButton(title: "Roulette", imageName: "roulette")
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
    }
    
    private func gameButton(title: String, imageName: String) -> some View {
        Button {
            print("Jouer à \(title)")
        } label: {
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .shadow(radius: 5)
                Text(title)
                    .font(.title3)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.green.opacity(0.7))
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.5), radius: 8)
        }
    }
}
