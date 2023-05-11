import SwiftUI

struct FunzoneView: View {
    
    @State var totalReward: Int = 0
    
    var body: some View {
      
        NavigationStack {
            VStack(alignment: .leading) {
                
                HStack {
                    
                    Text("Fun Zone")
                        .font(.system(size: 40, weight: .medium, design: .rounded))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("\(totalReward) 🪙")
                        .font(.system(size: 20, weight: .light, design: .rounded))
                        .foregroundColor(.white) 
                }
                
                Divider()
                
                ScrollView {
                    NavigationLink(destination: StoryListView()) { 
                        Card(title: "Stories", image: "books.vertical", color: .yellow)
                    }
                    
                    NavigationLink(destination: FactsView()) { 
                        Card(title: "Facts!", image: "star.fill", color: .green)
                    }
                    
                    NavigationLink(destination: ViedeosListView()) { 
                        Card(title: "Video", image: "video", color: .blue)
                    }
                    
                    NavigationLink(destination: ViedeosListView()) { 
                        Card(title: "Music", image: "music.note", color: .pink)
                    }
                    
                }
                
            }.padding()
                .onAppear(perform: {
                    totalReward = Store.shared.totalRewards
                })
        }
      
    }
}


struct Funzone_Previews: PreviewProvider {
    static var previews: some View {
        FunzoneView()
    }
}
