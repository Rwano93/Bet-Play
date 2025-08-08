import Foundation

final class WalletService: ObservableObject {
    @Published private(set) var balance: Int
    
    init(startingBalance: Int) {
        self.balance = startingBalance
    }
    
    func add(_ amount: Int) {
        balance += amount
    }
    
    func remove(_ amount: Int) {
        balance -= amount
    }
}
