import SwiftUI

enum Alphabets: String, CaseIterable {
    case A = "airplane"
    case B = "baseball.fill"
    case C = "deskclock"
    case D = "opticaldisc"
    case E = "globe.asia.australia"
    case F = "flame.fill"
    case G = "gearshape.fill"
    case H = "house"
    
    var getAlphabet: String {
        switch self {
        case .A:
            return "A"
        case .B:
            return "B"
        case .C:
            return "C"
        case .D:
            return "D"
        case .E:
            return "E"
        case .F:
            return "F"
        case .G:
            return "G"
        case .H:
            return "H"
        }
    }
}


struct AlphabetQuizView: View { 
    
    @State var options:[Alphabets] = [.A, .B, .C, .D]
    @State var question: Alphabets = .A
    @State var score: Int = 0
    @State var level: Int = 1
    
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            VStack() {
                
                HStack {
                    
                    Text("Level: \(level)")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    Spacer()
                    
                    Text("Score: \(score)/5")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                }
                
                Spacer()
                
                VStack(spacing: 30) {
                    Text(question.getAlphabet)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.pink)
                        .padding(.top, 10)
                    
                    Text("for")
                        .font(.system(size: 18, weight: .medium, design: .monospaced))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                VStack(spacing: 30) {
                    HStack(spacing: 20) {
                        SmallOptionButton(image: options[0].rawValue, color: .yellow) { 
                            checkAnswer(alpha: options[0])
                        }
                        
                        SmallOptionButton(image: options[1].rawValue, color: .yellow) { 
                            checkAnswer(alpha: options[1])
                        }
                    }
                    
                    HStack(spacing: 20) {
                        SmallOptionButton(image: options[2].rawValue, color: .yellow) { 
                            checkAnswer(alpha: options[2])
                        }
                        
                        SmallOptionButton(image: options[3].rawValue, color: .yellow) { 
                            checkAnswer(alpha: options[3])
                        }
                    }
                }
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    Button{
                        showingAlert.toggle()
                    }label: {
                        Label("", systemImage: "info.circle")
                            .frame(width: 50, height: 50, alignment: .center)
                    }
                    
                    .foregroundColor(.white)
                }
                
                SolidButton(title: "Skip", color: .pink) { 
                    let _options = generateQuestion()
                    options = _options
                }
            }.padding()
            
            if (score/5 != 0 && score != 0) {
                Color.black
                MoodForm(score: $score)
                    .onAppear(perform: {
                        level += 1
                    })
            }
        }.navigationTitle(Text("Alphabets"))
            .alert("Complete atleast 1 or 2 level to get proper statistics", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
    }
    
    private func checkAnswer(alpha: Alphabets) {
        if question.rawValue == alpha.rawValue {
            score += 1
        }
        
        let _options = generateQuestion()
        options = _options
    }
    
    private func generateQuestion() -> [Alphabets] {
        let questionAlphabet = Alphabets.allCases.randomElement() ?? .A
        question = questionAlphabet
        
        var randomOptions = getUniqueAlphabetsNumbers(count: 3)
        randomOptions.append(questionAlphabet)
        
        return randomOptions.shuffled()
    }
    
    private func getUniqueAlphabetsNumbers(count: Int) -> [Alphabets] {
        var set = Set<Alphabets>()
        while set.count < count {
            set.insert(Alphabets.allCases.randomElement() ?? .A)
        }
        return Array(set)
    }
}

struct AlphabetQuizView_Previews: PreviewProvider {
    static var previews: some View {
        AlphabetQuizView()
    }
}
