import SwiftUI

@main
struct BetAndPlayApp: App {
    @StateObject var user = UserService()
    @StateObject var viewRouter = ViewRouter()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(user)
                .environmentObject(viewRouter)
                .onAppear { user.restore() }
        }
    }
}

struct RootView: View {
    @EnvironmentObject var user: UserService
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        Group {
            switch viewRouter.currentPage {
            case "splash":
                SplashView()
            case "login":
                LoginView()
            case "menu":
                MainMenuView()
            case "profile":
                ProfileView()
            case "gameDetail":
                GameDetailView()
            default:
                SplashView()
            }
        }
        .animation(.easeInOut, value: viewRouter.currentPage)
        .transition(.opacity)
    }
}
