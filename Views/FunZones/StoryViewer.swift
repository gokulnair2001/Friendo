import SwiftUI

struct StoryViewerData: Identifiable {
    var id = UUID()
    
    var image: String
    var story: String
}

struct StoryViewer: View {
    
    @State var story:[StoryViewerData] = [StoryViewerData(image: "educationImage", story: "test")]
    @State private var currentPage: Int = 0
    
    var body: some View {
        ZStack {
            
            VStack {
                
                Spacer()
                
                VStack(spacing: 20) {
                    Image(story[currentPage].image)
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .padding()
                        .cornerRadius(20, antialiased: true)
                    
                    Text(story[currentPage].story)
                        .font(.system(.headline, design: .rounded, weight: .medium))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                        .padding(.horizontal, 10)
                }
                
                Spacer()
                
                Text("\(currentPage)/\(story.count-1)")
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                
                HStack(spacing: 20) {
                    Button {
                        if currentPage != 0 {
                            currentPage -= 1
                        }  
                    }label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 20, height: 25, alignment: .center)
                    }
                    
                    Divider()
                    
                    Button {
                        if currentPage != story.count-1 {
                            currentPage += 1
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
            }.padding()
            
            if Store.shared.totalRewards < 10 {
                
                Color.gray
                
                WarningScreen(image: "financial-crisis", title: "You dont have enough coins to read this story, complete few tasks to earn coins", actionButtonVisible: false, isShowing: .constant(true))
                    .frame(width: 250, height: 300, alignment: .center)
            }
        }.navigationTitle("Monkey and the Crocodile")
            .onAppear(perform: {
                if  Store.shared.totalRewards >= 10 {
                Store.shared.totalRewards -= 10
            }
            })
    }
}

struct StoryViewer_Previews: PreviewProvider {
    static var previews: some View {
        StoryViewer()
    }
}
