import SwiftUI

final class UserService: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var username: String = ""
    @Published var avatar: String = "avatar1" // image par défaut dans Assets
    @Published var balance: Int = 1000

    func login(email: String, password: String) {
        username = email.split(separator: "@").first.map(String.init) ?? "Joueur"
        isLoggedIn = true
        save()
    }

    func demoLogin() {
        username = "Guest"
        isLoggedIn = true
        save()
    }

    func logout() {
        isLoggedIn = false
        username = ""
        avatar = "avatar1"
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

    func restore() {
        let d = UserDefaults.standard
        isLoggedIn = d.bool(forKey: "isLoggedIn")
        username   = d.string(forKey: "username") ?? ""
        avatar     = d.string(forKey: "avatar") ?? "avatar1"
        balance    = d.integer(forKey: "balance")
    }
}
