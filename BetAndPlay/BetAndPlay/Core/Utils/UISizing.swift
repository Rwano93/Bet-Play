import SwiftUI

/// Scale responsive basé sur iPhone 14 (390x844)
struct UISizing {
    static func scale(_ width: CGFloat) -> CGFloat {
        max(0.75, min(1.0, width / 390.0))
    }
}
