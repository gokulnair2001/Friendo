import SwiftUI

struct FaqCard: View {
    
    @State var image: String
    @State var title: String
    @State var content: String
    @State var color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Image(systemName: image)
                    .resizable()
                    .foregroundColor(color)
                    .frame(width: 30, height: 25)
                    .padding()
                    .frame(width: 60, height: 60)
                    .background(.ultraThinMaterial)
                    .cornerRadius(35, antialiased: true)
                
                Text(title)
                    .font(.system(size: 22, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.leading, 10)
                
                Spacer()
            }
            
            Text(content)
                .font(.system(size: 22, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .padding(.leading, 10)
            
            Spacer()
            
        }.padding()
            .frame(maxWidth: .infinity, maxHeight: 750, alignment: .center)
            .background(color.opacity(0.55))
            .cornerRadius(40, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
}

struct FaqCard_Previews: PreviewProvider {
    static var previews: some View {
        FaqCard(image: "plus", title: "What is ADHD ?", content: Constants.shared.benefitsOfFriendo, color: .pink)
    }
}
