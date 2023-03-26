
import SwiftUI

struct Colors {
    static let black = Color.black.opacity(1)
    static let white = Color.white.opacity(1)

}
extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
