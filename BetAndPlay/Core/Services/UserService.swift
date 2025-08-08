import SwiftUI
final class UserService: ObservableObject {
    @Published var username: String = ""
    @Published var avatar: String = "avatar1"
    @Published var isLoggedIn: Bool = false
    func login(name: String, avatar: String) {
        self.username = name
        self.avatar = avatar
        self.isLoggedIn = true
    }
}
