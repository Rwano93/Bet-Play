import SwiftUI

struct SplashView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var scale: CGFloat = 0.8
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Text("Bet&Play")
                    .font(.largeTitle.bold())
                    .foregroundColor(.yellow)
                    .scaleEffect(scale)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1)) { scale = 1.2 }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation { viewRouter.currentPage = "login" }
                        }
                    }
            }
        }
    }
}
