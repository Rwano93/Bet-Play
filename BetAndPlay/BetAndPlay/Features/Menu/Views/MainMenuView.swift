import SwiftUI

struct MainMenuView: View {
    @EnvironmentObject var user: UserService
    @EnvironmentObject var viewRouter: ViewRouter

    let columns = [GridItem(.flexible(), spacing: 16),
                   GridItem(.flexible(), spacing: 16)]

    var body: some View {
        ZStack {
            // ✅ même fond pour cohérence
            CasinoBackgroundView(dim: 0.55, gradient: true)

            ScrollView {
                VStack(spacing: 20) {
                    // Top bar
                    HStack(spacing: 14) {
                        HStack(spacing: 12) {
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 40))
                                .foregroundStyle(.yellow)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(user.username.isEmpty ? "Guest" : user.username)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text("Solde: \(user.balance) €")
                                    .foregroundStyle(.yellow)
                                    .font(.subheadline)
                            }
                        }
                        Spacer()
                        Button {
                            user.logout()
                            withAnimation(.easeInOut) { viewRouter.currentPage = "login" }
                        } label: {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                .foregroundStyle(.white)
                                .padding(10)
                                .background(.white.opacity(0.12))
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal)

                    LazyVGrid(columns: columns, spacing: 16) {
                        MenuCard(title: "Blackjack", icon: "suit.club.fill") { /* open */ }
                        MenuCard(title: "Baccarat", icon: "suit.diamond.fill") { /* open */ }
                        MenuCard(title: "Roulette",  icon: "circle.grid.cross") { /* open */ }
                        MenuCard(title: "À venir",    icon: "sparkles") { }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 24)
            }
        }
        .transition(.opacity)
    }
}

private struct MenuCard: View {
    let title: String
    let icon: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 12) {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 56)
                    .foregroundStyle(.yellow)
                    .shadow(color: .black.opacity(0.4), radius: 6, y: 3)
                Text(title)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity, minHeight: 140)
            .padding()
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 18).stroke(.white.opacity(0.12), lineWidth: 1))
            .shadow(color: .black.opacity(0.35), radius: 10, y: 6)
        }
    }
}
