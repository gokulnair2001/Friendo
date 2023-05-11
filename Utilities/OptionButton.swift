import SwiftUI

struct SmallOptionButton: View {
    var image: String
    var color: Color
    var clicked: (() -> Void) /// use closure for callback
    
    var body: some View {
        VStack {
            Button(action: clicked) {
                Image(systemName: image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .font(Font.title.weight(.ultraLight))
                    .foregroundColor(color)
                    .padding()
                    .background(color.opacity(0.5))
                    .cornerRadius(12, antialiased: true)
            }
        }
    }
}


struct FormOptionButton: View {
    
    @State var title: String
    var colors:[Color] = [.red, .blue, .green, .yellow]
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 80))
                .frame(width: 150, height: 150)
                .background((colors.randomElement() ?? .yellow).opacity(0.7))
                .cornerRadius(8, antialiased: true)
        }
    }
}

