import SwiftUI

struct ContrastButton: View {
    var title: String
    var color: Color
    var opacity: Double = 0.3
    var clicked: (() -> Void) /// use closure for callback
    
    var body: some View {
        VStack {
            Button(action: clicked) {
                
                Text(title)
                    .fontWeight(.medium)
                    .foregroundColor(color)
                    .padding(5)
                    .frame(maxWidth: .infinity, maxHeight: 120)
                    .background(color.opacity(opacity))
                    .cornerRadius(8)
            }
        }
        .buttonStyle(.plain)
    }
}
