import SwiftUI

enum Numbers: Int, CaseIterable {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case ten = 10
    
    var getInText: String {
        switch self {
        case .one:
            return "One"
        case .two:
            return "Two"
        case .three:
            return "Three"
        case .four:
            return "Four"
        case .five:
            return "Five"
        case .six:
            return "Six"
        case .seven:
            return "Seven"
        case .eight:
            return "Eight"
        case .nine:
            return "Nine"
        case .ten:
            return "Ten"
        }
    }
}

struct NumberQuizView: View {
    
    @State var numbersInText: [Numbers] = Numbers.allCases
    @State var numbers:Range<Int> = 0..<20
    @State var answerNumber: Int = 1
    @State var options:[Int] = [1, 2, 3, 4]
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
                
                Text("Select the matching number")
                    .font(.title2)
                    .foregroundColor(.white)
                
                Text(Numbers(rawValue: answerNumber)?.getInText ?? "")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.green)
                    .padding(.top, 10)
                
                Spacer()
                
                VStack(spacing: 30) {
                    HStack(spacing: 20) {
                        SmallOptionButton(image: "\(options[0]).square", color: .pink) { 
                            checkAnswer(num: options[0])
                        }
                        
                        SmallOptionButton(image: "\(options[1]).square", color: .pink) { 
                            checkAnswer(num: options[1])
                        }
                    }
                    
                    HStack(spacing: 20) {
                        SmallOptionButton(image: "\(options[2]).square", color: .pink) { 
                            checkAnswer(num: options[2])
                        }
                        
                        SmallOptionButton(image: "\(options[3]).square", color: .pink) { 
                            checkAnswer(num: options[3])
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
                
                SolidButton(title: "Skip", color: .green) { 
                    let _options = getRandomNumbers()
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
        }.navigationTitle(Text("Numbers"))
            .alert("Complete atleast 1 or 2 level to get proper statistics", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
    }
    
    private func checkAnswer(num: Int) {
        if num == answerNumber {
            score += 1
        }
        
        let _options = getRandomNumbers()
        options = _options
    }
    
    private func getRandomNumbers() -> [Int] {
        let answer: Int = numbersInText.randomElement()?.rawValue ?? 2   
        answerNumber = answer
        
        var randomNumbers = getUniqueRandomNumbers(count: 3)
        randomNumbers.append(answer)
        return randomNumbers.shuffled()
    }
    
    private func getUniqueRandomNumbers(count: Int) -> [Int] {
        var set = Set<Int>()
        while set.count < count {
            set.insert(Int.random(in: 0...20))
        }
        return Array(set)
    }
}

struct NumberQuizView_Previews: PreviewProvider {
    static var previews: some View {
        NumberQuizView()
    }
}
