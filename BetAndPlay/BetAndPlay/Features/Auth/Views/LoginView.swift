import SwiftUI

struct LoginView: View {
    @EnvironmentObject var user: UserService
    @State private var name = ""
    @State private var selectedAvatar = "avatar1"
    
    let avatars = ["avatar1", "avatar2", "avatar3"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Bet&Play")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.yellow)
            
            TextField("Entrez votre pseudo", text: $name)
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)
                .foregroundColor(.white)
            
            Text("Choisissez votre avatar")
                .foregroundColor(.white)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(avatars, id: \.self) { avatar in
                        Image(avatar)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(selectedAvatar == avatar ? Color.yellow : Color.clear, lineWidth: 3)
                            )
                            .onTapGesture {
                                selectedAvatar = avatar
                            }
                    }
                }
            }
            
            Button(action: {
                guard !name.isEmpty else { return }
                user.login(name: name, avatar: selectedAvatar)
            }) {
                Text("Entrer dans le casino")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color.black.ignoresSafeArea())
    }
}
