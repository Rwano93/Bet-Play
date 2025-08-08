import SwiftUI

/// Un conteneur qui gère les Safe Areas pour éviter que le contenu soit coupé
struct SafeAreaWrapper<Content: View>: View {
    let content: Content
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                content
                    .frame(width: geo.size.width, height: geo.size.height)
                    .padding(.top, geo.safeAreaInsets.top)
                    .padding(.bottom, geo.safeAreaInsets.bottom)
            }
            .ignoresSafeArea(.all, edges: .vertical)
        }
    }
}
