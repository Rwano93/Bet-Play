import SwiftUI

struct LoginView: View {
    @EnvironmentObject var user: UserService
    @EnvironmentObject var viewRouter: ViewRouter

    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false

    var body: some View {
        GeometryReader { geo in
            let s = UISizing.scale(geo.size.width)

            ZStack {
                CasinoBackgroundView(dim: 0.45)

                VStack(spacing: 18*s) {
                    Spacer(minLength: 40*s)

                    Text("Connexion")
                        .font(.system(size: 28*s, weight: .bold, design: .rounded))
                        .foregroundColor(.white)

                    VStack(spacing: 12*s) {
                        HStack(spacing: 10*s) {
                            Image(systemName: "envelope.fill")
                                .foregroundColor(.yellow)
                                .font(.system(size: 14*s))
                            TextField("Email", text: $email)
                                .textInputAutocapitalization(.never)
                                .keyboardType(.emailAddress)
                                .autocorrectionDisabled(true)
                                .foregroundColor(.white)
                                .font(.system(size: 15*s))
                        }
                        .padding(14*s)
                        .background(Color.white.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 12*s))
                        .frame(maxWidth: 520)

                        HStack(spacing: 10*s) {
                            Image(systemName: "lock.fill")
                                .foregroundColor(.yellow)
                                .font(.system(size: 14*s))
                            Group {
                                if showPassword {
                                    TextField("Mot de passe", text: $password)
                                } else {
                                    SecureField("Mot de passe", text: $password)
                                }
                            }
                            .foregroundColor(.white)
                            .font(.system(size: 15*s))

                            Button { withAnimation { showPassword.toggle() } } label: {
                                Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.white.opacity(0.8))
                                    .font(.system(size: 14*s))
                            }
                        }
                        .padding(14*s)
                        .background(Color.white.opacity(0.15))
                        .clipShape(RoundedRectangle(cornerRadius: 12*s))
                        .frame(maxWidth: 520)
                    }
                    .padding(.horizontal, 24*s)

                    Button {
                        user.login(email: email, password: password)
                        withAnimation { viewRouter.currentPage = "menu" }
                    } label: {
                        Text("Se connecter")
                            .font(.system(size: 16*s, weight: .semibold, design: .rounded))
                            .frame(maxWidth: 520)
                            .padding(.vertical, 12*s)
                            .background(LinearGradient(colors: [.yellow, .orange], startPoint: .leading, endPoint: .trailing))
                            .foregroundColor(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 14*s))
                            .shadow(color: .yellow.opacity(0.4), radius: 8*s, y: 4*s)
                    }

                    Button {
                        user.demoLogin()
                        withAnimation { viewRouter.currentPage = "menu" }
                    } label: {
                        Text("Passer (mode démo)")
                            .font(.system(size: 15*s, weight: .medium))
                            .frame(maxWidth: 520)
                            .padding(.vertical, 11*s)
                            .background(Color.white.opacity(0.15))
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12*s))
                    }

                    Spacer(minLength: 40*s)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.horizontal, 12*s)
            }
        }
    }
}
