import SwiftUI

struct FactsModel {
    var fact: String
    var image: String
    var color: Color = [.green, .yellow, .blue, .pink].randomElement() ?? .pink
}

struct FactsView: View {
    
    @State var factsData: [FactsModel] = Constants.shared.facts
    @State var currentFact: Int = 0
    @State var isOverWhelmenessFormShown: Bool = false
    
    var body: some View {
        ZStack {
            factsData[currentFact].color.opacity(0.3)
            
            VStack {
                
                Spacer()
                
                Text( factsData[currentFact].fact)
                    .font(.system(.title2, design: .default, weight: .heavy))
                    .multilineTextAlignment(.center)
                    .frame(height: 250, alignment: .center)
                
                Spacer()
                
                Image(systemName: factsData[currentFact].image)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .font(Font.title.weight(.ultraLight))
                    .foregroundColor(factsData[currentFact].color)
                
                Spacer()
                
                HStack(spacing: 20) {
                    Button {
                        if currentFact != 0 {
                            currentFact -= 1
                        }  
                    }label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 20, height: 25, alignment: .center)
                    }
                    
                    Divider()
                    
                    Button {
                        if currentFact != factsData.count-1 {
                            currentFact += 1
                        }                  
                    }label: {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 20, height: 25, alignment: .center)
                    }
                }
                .padding()
                .frame(width: 150, height: 50, alignment: .center)
                .background(.ultraThinMaterial)
                .cornerRadius(25, antialiased: true) 
                
                Spacer()
                
            }.padding()
            
            if Store.shared.totalRewards < 9 {
                
                Color.gray
                
                WarningScreen(image: "financial-crisis", title: "You dont have enough coins to read the facts, complete few tasks to earn coins", actionButtonVisible: false, isShowing: .constant(true))
                    .frame(width: 250, height: 350, alignment: .center)
            }
            
            if !isOverWhelmenessFormShown {
                
                Color.black
                
                OverwhelmenessFormView(isShown: $isOverWhelmenessFormShown)
            }
            
        }.navigationTitle("Facts Zone")
            .onAppear(perform: {
                Store.shared.totalRewards -= 10
            })
    }
}

struct FactsView_Previews: PreviewProvider {
    static var previews: some View {
        FactsView()
    }
}
