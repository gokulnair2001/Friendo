import SwiftUI

struct FunCard: View {
    
    @State var title: String
    @State var image: String
    
    var body: some View {
        VStack {
            
            Image(image)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: 200)
                .aspectRatio(contentMode: .fill)
            
            Spacer()
            
            HStack {
                Text(title)
                    .font(.system(.largeTitle, design: .rounded))
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("⭐️⭐️⭐️⭐️⭐️")
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                
            }.padding()
            
        }
            .frame(maxWidth: 400, idealHeight: 300, maxHeight: 200, alignment: .center)
            .background(.black)
            .cornerRadius(26, antialiased: true)
    }
}

struct FunCard_Previews: PreviewProvider {
    static var previews: some View {
        FunCard(title: "🐒 and the 🐊", image: "StoryCover")
    }
}
