import SwiftUI

@main
struct BetAndPlayApp: App {
    @StateObject var wallet = WalletService(startingBalance: 1000)
    @StateObject var user = UserService()
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            switch viewRouter.currentPage {
            case "splash":
                SplashView()
                    .environmentObject(wallet)
                    .environmentObject(user)
                    .environmentObject(viewRouter)
            case "login":
                LoginView()
                    .environmentObject(wallet)
                    .environmentObject(user)
                    .environmentObject(viewRouter)
            case "menu":
                MainMenuView()
                    .environmentObject(wallet)
                    .environmentObject(user)
                    .environmentObject(viewRouter)
            default:
                SplashView()
                    .environmentObject(wallet)
                    .environmentObject(user)
                    .environmentObject(viewRouter)
            }
        }
    }
}
