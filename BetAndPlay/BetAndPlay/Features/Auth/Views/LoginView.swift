import SwiftUI

struct LoginView: View {
    @EnvironmentObject var user: UserService
    @EnvironmentObject var viewRouter: ViewRouter

    @State private var email = ""
    @State private var password = ""

    var body: some View {
        ZStack {
            // 🔴 Image casino en arrière-plan
            Image("CasinoBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            // léger assombrissement pour la lisibilité
            Color.black.opacity(0.35).ignoresSafeArea()

            VStack(spacing: 22) {
                Spacer(minLength: 40)
                Text("Connexion")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundStyle(.white)

                VStack(spacing: 14) {
                    TextField("Email", text: $email)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                        .padding()
                        .background(.white.opacity(0.15))
                        .cornerRadius(12)
                        .foregroundStyle(.white)

                    SecureField("Mot de passe", text: $password)
                        .padding()
                        .background(.white.opacity(0.15))
                        .cornerRadius(12)
                        .foregroundStyle(.white)
                }
                .padding(.horizontal)

                Button {
                    user.login(email: email, password: password)
                    withAnimation(.easeInOut) { viewRouter.currentPage = "menu" }
                } label: {
                    Text("Se connecter")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color.yellow)
                        .foregroundStyle(.black)
                        .cornerRadius(14)
                        .shadow(radius: 6)
                }
                .padding(.horizontal)

                Button {
                    user.demoLogin()
                    withAnimation(.easeInOut) { viewRouter.currentPage = "menu" }
                } label: {
                    Text("Passer (mode démo)")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Color.white.opacity(0.15))
                        .foregroundStyle(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)

                Spacer()
            }
        }
        .transition(.move(edge: .trailing).combined(with: .opacity))
    }
}
