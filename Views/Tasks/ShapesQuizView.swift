import SwiftUI

enum Shapes: String, CaseIterable {
    case Circle = "circle.fill"
    case Square = "square.fill"
    case Rectangle = "rectangle.fill"
    case Hexagon = "hexagon.fill"
    case Triangle = "triangle.fill"
    case Seal = "seal.fill"
    case Rhombus = "rhombus.fill"
    
    var shapeName: String {
        switch self {
        case .Circle:
            return "Circle"
        case .Square:
            return "Square"
        case .Rectangle:
            return "Rectangle"
        case .Hexagon:
            return "Hexagon"
        case .Triangle:
            return "Triangle"
        case .Seal:
            return "Seal"
        case .Rhombus:
            return "Rhombus"
        }
    }
}

struct ShapeQuizView: View {
    @State var options:[Shapes] = [.Square, .Circle, .Hexagon, .Seal]
    @State var question: Shapes = .Circle 
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
                    Text(question.shapeName)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.yellow)
                        .padding(.top, 10)
                    
                    Text("for")
                        .font(.system(size: 18, weight: .medium, design: .monospaced))
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                VStack(spacing: 30) {
                    HStack(spacing: 20) {
                        SmallOptionButton(image: options[0].rawValue, color: .green) { 
                            checkAnswer(alpha: options[0])
                        }
                        
                        SmallOptionButton(image: options[1].rawValue, color: .green) { 
                            checkAnswer(alpha: options[1])
                        }
                    }
                    
                    HStack(spacing: 20) {
                        SmallOptionButton(image: options[2].rawValue, color: .green) { 
                            checkAnswer(alpha: options[2])
                        }
                        
                        SmallOptionButton(image: options[3].rawValue, color: .green) { 
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
                
                SolidButton(title: "Skip", color: .yellow) { 
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
        }.navigationTitle(Text("Shapes"))
            .alert("Complete atleast 1 or 2 level to get proper statistics", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
    }
    
    private func checkAnswer(alpha: Shapes) {
        if question.rawValue == alpha.rawValue {
            score += 1
        }
        
        let _options = generateQuestion()
        options = _options
    }
    
    private func generateQuestion() -> [Shapes] {
        let questionAlphabet = Shapes.allCases.randomElement() ?? .Circle
        question = questionAlphabet
        
        var randomOptions = getUniqueAlphabetsNumbers(count: 3)
        randomOptions.append(questionAlphabet)
        
        return randomOptions.shuffled()
    }
    
    private func getUniqueAlphabetsNumbers(count: Int) -> [Shapes] {
        var set = Set<Shapes>()
        while set.count < count {
            set.insert(Shapes.allCases.randomElement() ?? .Circle)
        }
        return Array(set)
    }
}

struct ShapeQuizView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeQuizView()
    }
}
