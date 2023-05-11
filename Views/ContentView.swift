import SwiftUI

struct ContentView: View {
    
    @Binding var isShowing: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.black
                
                VStack {
                    Spacer()
                    
                    Image("IconImage")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                    
                    Text("Friendo 👋")
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                    
                    Text("Your ultimate friend")
                        .font(.system(.title2, design: .rounded, weight: .medium))
                        .foregroundColor(.orange)
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: IntroView(isShowing: $isShowing),
                        label: {
                            HStack(spacing: 10) {
                                Text("Continue")
                                    .font(.system(.title2, design: .rounded, weight: .medium))
                                    .foregroundColor(.white)
                                    .padding()
                            }.frame(maxWidth: .infinity, maxHeight: 30)
                                .padding()
                                .background(.orange)
                                .cornerRadius(8)
                        })
                }.padding(10)
                
            }
        }
    }
}
