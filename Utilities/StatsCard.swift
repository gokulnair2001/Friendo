import SwiftUI

struct StatsCard: View {
    
    @State var title: String
    @State var value: String
    @State var color: Color = .orange
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .foregroundColor(color)
            
            Text(value)
                .font(.system(size: 26, weight: .medium, design: .rounded))
                .foregroundColor(.white)
            
        }.padding()
            .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(20, antialiased: true)
        
    }
}

struct StatsCard_Previews: PreviewProvider {
    static var previews: some View {
        StatsCard(title: "Test", value: "test", color: .yellow)
    }
}
