import SwiftUI

struct SplashView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var logoScale: CGFloat = 0.88
    @State private var opacity: Double = 0

    var body: some View {
        ZStack {
            CasinoBackgroundView(dim: 0.35)

            VStack(spacing: 14) {
                Image(systemName: "suit.club.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.yellow)
                    .shadow(radius: 12)
                    .scaleEffect(logoScale)
                    .opacity(opacity)

                Text("Bet & Play")
                    .font(.system(size: 34, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                    .opacity(opacity)
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.8)) {
                opacity = 1
                logoScale = 1.0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
                withAnimation(.easeInOut) { viewRouter.currentPage = "login" }
            }
        }
    }
}
