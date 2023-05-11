import SwiftUI

struct IntroView: View {
    
    @Binding var isShowing: Bool
    @State var isFirstPage: Bool = true
    
    var body: some View {
        
        ZStack {
            Color.black
            
            VStack {
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 15)  {
                        
                        if isFirstPage {
                            
                            FaqCard(image: "plus", title: "What is ADHD 👀?", content: Constants.shared.whatIsADHD, color: .blue)
                            
                            Divider()
                            
                            FaqCard(image: "plus", title: "How to know if I have ADHD 🤥?", content: Constants.shared.symptomsOfADHD, color: .yellow)
                            
                        }
                        
                        if !isFirstPage {
                            
                            FaqCard(image: "plus", title: "Why Friendo🤨?", content: Constants.shared.whyFriendo, color: .pink)
                            
                            Divider()
                            
                            FaqCard(image: "plus", title: "What Friendo does🤔?", content: Constants.shared.whatFriendoDoes, color: .blue)
                            
                            Divider()
                            
                            FaqCard(image: "plus", title: "Benefits of Friendo 🤟🏼", content: Constants.shared.benefitsOfFriendo, color: .yellow)
                            
                        }
                        
                    }
                }
                
                RoundButton(image: isFirstPage ? "arrow.right" : "arrow.left", color: .orange) {
                    withAnimation {
                        isFirstPage.toggle()
                    }
                }.padding(20)
                
            }.padding(10)
                .navigationTitle( isFirstPage ? "Why this app?" : "How can it help?")
                .toolbar(content: {
                    if !isFirstPage {
                        ContrastButton(title: "X", color: .gray, opacity: 0.4) { 
                            isShowing = false
                        }.frame(width: 30, height: 30, alignment: .center)
                    }
                })
        }
        
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView(isShowing: .constant(true), isFirstPage: false)
    }
}
