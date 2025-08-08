import SwiftUI

@main
struct BetAndPlayApp: App {
    @StateObject private var wallet = WalletService(startingBalance: 1000)
    @StateObject private var user = UserService()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if user.isLoggedIn {
                    MainMenuView()
                        .environmentObject(wallet)
                        .environmentObject(user)
                } else {
                    LoginView()
                        .environmentObject(wallet)
                        .environmentObject(user)
                }
            }
        }
    }
}
