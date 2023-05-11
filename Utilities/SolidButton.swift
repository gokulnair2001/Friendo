import SwiftUI

struct SolidButton: View {
    var title: String
    var color: Color
    var clicked: (() -> Void) /// use closure for callback
    
    var body: some View {
        VStack {
            Button(action: clicked) {
                
                HStack(spacing: 10) {
                    Text(title)
                        .font(.system(size: 20, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                        .padding()
                }.frame(maxWidth: .infinity, maxHeight: 30)
                    .padding()
                    .background(color)
                    .cornerRadius(8)
            }
        }
    }
}


struct RoundButton: View {
    var image: String
    var color: Color
    var clicked: (() -> Void) /// use closure for callback
    
    var body: some View {
        VStack {
            Button(action: clicked) {
                HStack(spacing: 10) {
                    Image(systemName: image)
                        .resizable()
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                        .frame(width: 30, height: 25)
                        .padding()
                        .frame(width: 60, height: 60)
                        .background(color)
                        .cornerRadius(30, antialiased: true)
                        
                }.frame(maxWidth: .infinity, maxHeight: 30, alignment: .trailing)
            }
        }
    }
}
