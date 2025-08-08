import SwiftUI

final class UserService: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var username: String = ""
    @Published var avatar: String = "person.circle"
    @Published var balance: Int = 1000

    func login(email: String, password: String) {
        username = email.split(separator: "@").first.map(String.init) ?? "Joueur"
        avatar = "person.circle"
        isLoggedIn = true
        save()
    }

    func demoLogin() {
        username = "Guest"
        avatar = "person.circle"
        balance = 1000
        isLoggedIn = true
        save()
    }

    func logout() {
        isLoggedIn = false
        username = ""
        avatar = "person.circle"
        balance = 0
        save()
    }

    private func save() {
        let d = UserDefaults.standard
        d.set(isLoggedIn, forKey: "isLoggedIn")
        d.set(username,  forKey: "username")
        d.set(avatar,    forKey: "avatar")
        d.set(balance,   forKey: "balance")
    }

    /// IMPORTANT : pendant le dev on n’auto-connecte PAS → on force l’écran Login
    func restore() {
        let d = UserDefaults.standard
        username   = d.string(forKey: "username") ?? ""
        avatar     = d.string(forKey: "avatar") ?? "person.circle"
        balance    = d.integer(forKey: "balance")
        isLoggedIn = false  // <-- on ne saute plus la connexion
    }
}
