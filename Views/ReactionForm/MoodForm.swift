import SwiftUI

enum MoodTypes: Int, CaseIterable {
    case happy = 10
    case veryHappy = 20
    case ok = 0
    case sad = -5
    case verySad = -10
    case crying = -20
    
    var emoji: String {
        switch self {
        case .happy:
            return "😊"
        case .veryHappy:
            return "😁"
        case .ok:
            return "😐"
        case .sad:
             return "☹️"
        case .verySad:
             return "😔"
        case .crying:
            return "😭"
        }
    }
}

struct MoodForm: View {
    
    var layout = [GridItem(.adaptive(minimum: 140, maximum: .infinity))]
    var moods:[MoodTypes] = MoodTypes.allCases
    
    @Binding var score: Int
    
    var body: some View {
        VStack {
            Text("How is your Mood?")
                .font(.largeTitle)
                .fontWeight(.heavy)
              .multilineTextAlignment(.center)
            
            LazyVGrid(columns: layout, spacing: 10) {
                ForEach(moods, id: \.self) { mood in
                    FormOptionButton(title: mood.emoji)
                        .onTapGesture {
                            Store.shared.moods.append(MoodModel(date: Date(), mood: mood.emoji, scores: mood.rawValue))
                            Store.shared.totalRewards += 5
                            Store.shared.totalGames += 1
                            score = 0
                        }
                }
            }
        }.padding()
    }
}
