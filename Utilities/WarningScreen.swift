import SwiftUI

struct WarningScreen: View {
    
    var image: String
    var title: String
    var actionButtonVisible: Bool = false
    @Binding var isShowing: Bool
   
    
    var body: some View {
        VStack {
            
            Image(image)
                .resizable()
                .foregroundColor(.white)
                .frame(width: 150, height: 150)
                .padding()
                
            
            Text(title)
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .multilineTextAlignment(.center)
                .lineLimit(9)
            
            Spacer()
            
            if actionButtonVisible {
                SolidButton(title: "Ok", color: .blue) { 
                    isShowing.toggle()
                }
            }
            
        }.padding()
            .background(.ultraThinMaterial)
            .cornerRadius(6, antialiased: true)
    }
}

struct WarningScreen_Previews: PreviewProvider {
    static var previews: some View {
        WarningScreen(image: "financial-crisis", title: "No enough coins to have fun\nComplete tasks to earn coins🪙", actionButtonVisible: true, isShowing: .constant(true))
    }
}
