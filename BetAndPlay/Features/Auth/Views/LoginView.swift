import SwiftUI
struct LoginView: View {
    @EnvironmentObject var user: UserService
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var name = ""
    let avatar = "avatar1"
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("Bienvenue")
                .font(.casinoTitle(size: 30))
                .foregroundColor(.gold)
            Image(avatar)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .clipShape(Circle())
            TextField("Entrez votre pseudo", text: $name)
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)
                .foregroundColor(.white)
            Button(action: {
                guard !name.isEmpty else { return }
                user.login(name: name, avatar: avatar)
                viewRouter.currentPage = "menu"
            }) {
                Text("Entrer dans le casino")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gold)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .padding()
        .background(Color.black.ignoresSafeArea())
    }
}
