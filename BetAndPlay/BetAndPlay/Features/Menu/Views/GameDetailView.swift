// BetAndPlay/BetAndPlay/Features/Menu/Views/GameDetailView.swift
import SwiftUI

struct GameDetailView: View {
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        if let g = viewRouter.selectedGame {
            GeometryReader { geo in
                let s = UISizing.scale(geo.size.width)
                ZStack {
                    CasinoBackgroundView(dim: 0.55)

                    VStack(spacing: 16*s) {
                        HStack {
                            Button {
                                withAnimation { viewRouter.currentPage = "menu" }
                            } label: {
                                HStack(spacing: 6*s) {
                                    Image(systemName: "chevron.left")
                                    Text("Retour")
                                }
                                .font(.system(size: 14*s, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(8*s)
                                .background(Color.white.opacity(0.15))
                                .clipShape(Capsule())
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 12*s)

                        Image(g.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 170*s)
                            .clipShape(RoundedRectangle(cornerRadius: 16*s))
                            .shadow(radius: 6*s)

                        Text(g.title)
                            .font(.system(size: 26*s, weight: .heavy, design: .rounded))
                            .foregroundColor(.yellow)

                        ScrollView {
                            Text(g.rules)
                                .foregroundColor(.white)
                                .font(.system(size: 15*s))
                                .padding(14*s)
                                .background(Color.black.opacity(0.3))
                                .clipShape(RoundedRectangle(cornerRadius: 12*s))
                                .padding(.horizontal, 14*s)
                        }

                        Button {
                            print("Lancer \(g.title)")
                        } label: {
                            Text("JOUER")
                                .font(.system(size: 16*s, weight: .bold))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12*s)
                                .background(Color.yellow)
                                .foregroundColor(.black)
                                .clipShape(RoundedRectangle(cornerRadius: 14*s))
                                .shadow(radius: 6*s)
                                .padding(.horizontal, 20*s)
                        }

                        Spacer(minLength: 12*s)
                    }
                }
            }
        } else {
            // Fallback si pas de jeu sélectionné
            Text("Aucun jeu sélectionné")
                .foregroundColor(.white)
                .background(CasinoBackgroundView(dim: 0.55))
        }
    }
}
