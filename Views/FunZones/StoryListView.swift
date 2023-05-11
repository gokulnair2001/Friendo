import SwiftUI

struct StoryListView: View {
    
    @State var stories: [[StoryViewerData]] = Constants.shared.stories
    @State var isOverWhelmenessFormShown: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                
                NavigationLink(
                    destination: StoryViewer(story: stories[0]),
                    label: {
                        FunCard(title: "🐒 and the 🐊", image: "StoryCover")
                    })
                
                Spacer()
                
                Text("More stories coming soon!")
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                
                Spacer()
                
            }.padding()
            
            if !isOverWhelmenessFormShown {
                
                Color.black
                
                OverwhelmenessFormView(isShown: $isOverWhelmenessFormShown)
            }
        } .navigationTitle(Text("Stories"))
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}
