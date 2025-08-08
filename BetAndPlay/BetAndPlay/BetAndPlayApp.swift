import SwiftUI

@main
struct BetAndPlayApp: App {
<<<<<<< HEAD
    @StateObject var wallet = WalletService(startingBalance: 1000)
    @StateObject var user = UserService()
    @StateObject var viewRouter = ViewRouter()
=======

    @StateObject private var wallet = WalletService(startingBalance: 1000)
    @StateObject private var user = UserService()
>>>>>>> 9d73a983b77b552b03a572e4e6d365f9792d4127
    

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
