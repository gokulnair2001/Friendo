import SwiftUI

struct TasksView: View {
    
    @State var totalRewards: Int = 0
    @AppStorage("isShowingAppInstructions") var isShowingAppInstruction: Bool = true
    
    var body: some View {
        NavigationStack {
           
            ZStack {
                VStack(alignment: .leading) {
                    
                    
                    HStack {
                        Spacer()
                        
                        Text("\(totalRewards) 🪙")
                            .font(.system(size: 20, weight: .light, design: .rounded))
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("Hello👋")
                            .font(.system(size: 20, weight: .light, design: .monospaced))
                            .foregroundColor(.white)
                        
                        Text("Learn Zone")
                            .font(.system(size: 40, weight: .medium, design: .monospaced))
                            .foregroundColor(.white)
                        
                    }
                    
                    Divider()
                    
                    ScrollView {
                        
                        NavigationLink(destination: AlphabetQuizView()) {
                            Card(title: "Alphabets", image: "textformat.abc", color: .pink)
                        } 
                        
                        NavigationLink(destination: ShapeQuizView()) {
                            Card(title: "Shapes", image: "circle.hexagonpath", color: .yellow)
                        }
                        
                        NavigationLink(destination: NumberQuizView()) {
                            Card(title: "Numbers", image: "textformat.123", color: .green)
                        }   
                    }
                    
                    Spacer()
                    
                }.padding()
                    .onAppear(perform: {
                        totalRewards = Store.shared.totalRewards
                    })
                
                if isShowingAppInstruction {
                    Color.black
                    AppInstructionView(isShowing: $isShowingAppInstruction)
                }
            }
           
        }
    }
   
}
