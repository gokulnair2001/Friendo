import SwiftUI

struct AppInstructionView: View {
    
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            Spacer()
            
            Image("IconImage")
                .resizable()
                .frame(width: 80, height: 80, alignment: .center)
            
            Text("Friendo👋\nYour all time friend")
                .font(.system(.title, design: .rounded, weight: .medium))
                .multilineTextAlignment(.center)
            
            VStack(alignment: .leading, spacing: 0) {
                markupUI(image: "figure.table.tennis",title: "Lack of Focus", content: "Friendo fills the gap by making childrens focused", color: .yellow)
                
                markupUI(image: "rectangle.inset.filled.and.person.filled", title: "Learn & Enjoy", content: "Provides various types of Tasks which are fun interacting, such that childrens play those games with all their focus", color: .pink)
                
                markupUI(image: "dollarsign.circle", title: "Rewards", content: "On completing a Level they are provided with reward coins", color: .green)
                
                markupUI(image: "bag", title: "Spend for Fun", content: "FunZone requires rewards to access it", color: .blue)
                
                markupUI(image: "chart.pie", title: "Analysis", content: "Creates a statistical graph and suggests kind of caring child requires", color: .red)
                
            }.padding(20)
            
            Spacer()
            
            SolidButton(title: "Continue", color: .yellow) { 
                withAnimation {
                    isShowing.toggle()
                }
            }
            
        }.padding()
    }
    
    @ViewBuilder
    func markupUI(image: String, title: String, content: String, color: Color) -> some View {
        
        HStack(spacing: 20) {
          
            Image(systemName: image)
                .resizable()
                .foregroundColor(color)
                .fontWeight(.medium)
                .frame(width: 40, height: 40)
          
            VStack(alignment: .leading, spacing: 8) {
                
                Text(title)
                    .font(.system(.headline, design: .rounded, weight: .heavy))
                    .foregroundColor(.white)
                
                Text(content)
                    .font(.system(.subheadline, design: .rounded, weight: .semibold))
                    .foregroundColor(.gray)
            }
        }.frame(height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
    }
}

struct AppInstructionView_Previews: PreviewProvider {
    static var previews: some View {
        AppInstructionView(isShowing: .constant(true))
    }
}
