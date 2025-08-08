import SwiftUI

final class ViewRouter: ObservableObject {
    @Published var currentPage: String = "splash" // "splash" | "login" | "menu"
}
