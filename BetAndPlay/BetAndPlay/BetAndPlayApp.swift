import SwiftUI

@main
struct BetAndPlayApp: App {
    @StateObject var wallet = WalletService(startingBalance: 1000)
    @StateObject var user = UserService()
    @StateObject var viewRouter = ViewRouter()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(wallet)
                .environmentObject(user)
                .environmentObject(viewRouter)
                .onAppear { user.restore() }
        }
    }
}

private struct RootView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var user: UserService

    var body: some View {
        Group {
            switch user.isLoggedIn ? "menu" : viewRouter.currentPage {
            case "splash": SplashView()
            case "login":  LoginView()
            case "menu":   MainMenuView()
            default:       SplashView()
            }
        }
        .animation(.easeInOut, value: viewRouter.currentPage)
        .transition(.move(edge: .trailing).combined(with: .opacity))
    }
}
