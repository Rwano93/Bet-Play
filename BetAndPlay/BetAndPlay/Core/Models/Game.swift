// BetAndPlay/BetAndPlay/Core/Models/Game.swift
import Foundation

public struct Game: Hashable, Identifiable {
    public let id = UUID()
    public let title: String
    public let subtitle: String
    public let imageName: String
    public let rules: String
}
