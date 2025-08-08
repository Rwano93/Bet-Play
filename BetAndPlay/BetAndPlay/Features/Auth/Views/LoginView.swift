import SwiftUI

struct LoginView: View {
    @EnvironmentObject var user: UserService
    @EnvironmentObject var viewRouter: ViewRouter

    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false

    var body: some View {
        ZStack {
            // ✅ TON image de fond
            CasinoBackgroundView(dim: 0.35, gradient: true)

            // Carte en verre
            VStack(spacing: 22) {
                Text("Connexion")
                    .font(.system(size: 34, weight: .heavy))
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.6), radius: 8, y: 2)

                VStack(spacing: 14) {
                    HStack(spacing: 12) {
                        Image(systemName: "envelope.fill")
                            .foregroundStyle(.yellow.opacity(0.9))
                        TextField("Email", text: $email)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.emailAddress)
                            .foregroundStyle(.white)
                    }
                    .padding(14)
                    .background(.white.opacity(0.12))
                    .overlay(RoundedRectangle(cornerRadius: 14).stroke(.white.opacity(0.20), lineWidth: 1))
                    .cornerRadius(14)

                    HStack(spacing: 12) {
                        Image(systemName: "lock.fill")
                            .foregroundStyle(.yellow.opacity(0.9))
                        Group {
                            if showPassword {
                                TextField("Mot de passe", text: $password)
                            } else {
                                SecureField("Mot de passe", text: $password)
                            }
                        }
                        .foregroundStyle(.white)

                        Button { withAnimation { showPassword.toggle() } } label: {
                            Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                .foregroundStyle(.white.opacity(0.8))
                        }
                    }
                    .padding(14)
                    .background(.white.opacity(0.12))
                    .overlay(RoundedRectangle(cornerRadius: 14).stroke(.white.opacity(0.20), lineWidth: 1))
                    .cornerRadius(14)
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
                        .background(LinearGradient(colors: [.yellow, .orange], startPoint: .leading, endPoint: .trailing))
                        .foregroundStyle(.black)
                        .cornerRadius(16)
                        .shadow(color: .yellow.opacity(0.5), radius: 10, y: 4)
                }
                .padding(.horizontal)

                Button {
                    user.demoLogin()
                    withAnimation(.easeInOut) { viewRouter.currentPage = "menu" }
                } label: {
                    Text("Passer (mode démo)")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Color.white.opacity(0.12))
                        .overlay(RoundedRectangle(cornerRadius: 14).stroke(.white.opacity(0.18), lineWidth: 1))
                        .foregroundStyle(.white)
                        .cornerRadius(14)
                }
                .padding(.horizontal)
            }
            .padding(24)
            .frame(maxWidth: 520)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 28, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 28, style: .continuous)
                    .stroke(.white.opacity(0.12), lineWidth: 1)
            )
            .shadow(color: .black.opacity(0.4), radius: 18, y: 10)
            .padding(.horizontal, 24)
        }
        .transition(.opacity) // pas de slide qui dévoile un écran dessous
    }
}
