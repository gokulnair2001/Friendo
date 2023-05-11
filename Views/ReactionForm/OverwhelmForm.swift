import SwiftUI

struct OverwhelmenessFormView: View {
    
    var layout = [GridItem(.adaptive(minimum: 140, maximum: .infinity))]
    var whelmness:[Int] = [0, 20, 40, 60, 80, 100]
    var colors:[Color] = [.red, .blue, .green, .yellow]
    
    @Binding var isShown: Bool
    
    var body: some View {
        VStack {
            Text("How Overwhelmed are you?")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
            
            LazyVGrid(columns: layout, spacing: 10) {
                ForEach(whelmness, id: \.self) { whelm in
                    FormOptionButton(title: "\(whelm)")
                        .onTapGesture {
                            Store.shared.whelmeness.append(WhelmenessModel(date: Date(), whelmeness: "\(whelm)"))
                            isShown = true
                        }
                }
            }
            
            Text("Its ok to be Overwhelmed ☺️")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding(.top, 30)
        }.padding()
    }
}

