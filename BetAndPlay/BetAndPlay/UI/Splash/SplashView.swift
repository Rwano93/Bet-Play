import SwiftUI

struct SplashView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var scale: CGFloat = 0.85
    @State private var opacity: Double = 0.0

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.black, Color.red.opacity(0.85)],
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Image(systemName: "suit.club.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundStyle(.yellow)
                    .shadow(radius: 10)
                    .scaleEffect(scale)
                    .opacity(opacity)

                Text("Bet & Play")
                    .font(.system(size: 34, weight: .heavy))
                    .foregroundStyle(.white)
                    .opacity(opacity)
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.9)) { scale = 1.05; opacity = 1 }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                withAnimation(.easeInOut) { viewRouter.currentPage = "login" }
            }
        }
    }
}
