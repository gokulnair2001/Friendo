import SwiftUI

struct Card: View {
    
    @State var title: String
    @State var image: String
    @State var color: Color
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: image)
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 30, height: 25)
                    .padding()
                    .frame(width: 70, height: 70)
                    .background(.ultraThinMaterial)
                    .cornerRadius(35, antialiased: true)
                
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Text(title)
                    .font(.system(size: 25, weight: .medium, design: .monospaced))
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(systemName: "arrow.forward")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 20, height: 20)
                    .padding()
                    .frame(width: 50, height: 50)
                    .background(.ultraThinMaterial)
                    .cornerRadius(35, antialiased: true)
            }
            
        }.padding()
            .frame(maxWidth: .infinity, idealHeight: 200, maxHeight: 200, alignment: .center)
            .background(color)
            .cornerRadius(26, antialiased: true)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(title: "help", image: "heart", color: .red)
    }
}
