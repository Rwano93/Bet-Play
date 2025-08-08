// BetAndPlay/BetAndPlay/Core/Services/ViewRouter.swift
import SwiftUI

final class ViewRouter: ObservableObject {
    @Published var currentPage: String = "splash"
    @Published var selectedGame: Game? = nil
}
