import SwiftUI
import Charts

struct StatisticsView: View {
    
    @State var totalRewards: Int = 0
    @State var moodData:[MoodModel] = []
    @State var moodCountData:[String: Int] = [:]
    @State var whelmenessData:[WhelmenessModel] = []
    @State var whelmenessCountData:[String: Int] = [:]
    @State var moodScore: Int = 0
    @State var whelmenessScore: Int = 0
    @State var totalsTasks: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                
                if moodData.count != 0 {
                    ScrollView {
                        HStack {
                            
                            Text("Analysis")
                                .font(.system(size: 40, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Text("\(totalRewards) 🪙")
                                .font(.system(size: 20, weight: .light, design: .rounded))
                                .foregroundColor(.white) 
                        }
                        
                        Divider()
                        
                        VStack(alignment: .leading) {
                            
                            StatsCard(title: "Total task", value: "\(totalsTasks)", color: .pink)
                            
                            StatsCard(title: "Mood Score", value: "\(moodScore)")
                            
                            moodSwingChart
                            
                            VStack {
                                if moodScore > 0 {
                                    StatsCard(title: "Doctors Care", value: "Not required", color: .pink) 
                                    StatsCard(title: "Parental Care", value: "Normal", color: .yellow) 
                                    StatsCard(title: "Emotions", value: "Low", color: .orange)
                                }
                                
                                if moodScore == 0 {
                                    StatsCard(title: "Doctor Care", value: "Not required", color: .pink)  
                                    StatsCard(title: "Parental Care", value: "Normal", color: .yellow) 
                                    StatsCard(title: "Emotions", value: "Normal", color: .orange)
                                }
                                
                                if moodScore < 0 {
                                    StatsCard(title: "Doctor Care", value: "Highly required", color: .pink)
                                    StatsCard(title: "Parental Care", value: "High", color: .yellow) 
                                    StatsCard(title: "Emotions", value: "High", color: .orange)
                                }
                            }
                            
                            moodTypeChart
                            
                            whelmenessChart
                            
                           StatsCard(title: "Whelmeness Score", value: "\(whelmenessScore)", color: .blue)
                            
                            VStack {
                                if whelmenessScore > 50 {
                                    StatsCard(title: "Sensitive", value: "Highly")
                                }
                                
                                if whelmenessScore == 50 {
                                    StatsCard(title: "Sensitive", value: "Normal")
                                }
                                
                                if whelmenessScore < 50 {
                                   StatsCard(title: "Sensitive", value: "Low")
                                }
                            }
                        }
                    }
                } 
                
                if moodData.count == 0 {
                    WarningScreen(image: "educationImage", title: "You dont have enough data, complete few more tasks \n\n(Cross 1 Level in any task to see statistics)", isShowing: .constant(true))
                        .frame(width: 300, height: 370, alignment: .center)
                }
                
            }.padding()
                .onAppear(perform: {
                    totalRewards = Store.shared.totalRewards
                    moodCountData = Store.shared.getOccourances()
                    moodData = Store.shared.moods
                    whelmenessData = Store.shared.whelmeness
                    whelmenessCountData = Store.shared.getWhelmenessOccourances()
                    moodScore = Store.shared.getMoodScore()
                    whelmenessScore = Store.shared.getWhelmenessScore()
                    totalsTasks = Store.shared.totalGames
                })
        }
    }
    
    var moodSwingChart: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Mood Swings")
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                Text("This is how your childs mood changed")
                    .font(.system(size: 16, weight: .light, design: .rounded))
                    .foregroundColor(.blue)
            }
            
            Chart {
                ForEach(moodData, id: \.id) { mood in
                    LineMark(
                        x: .value("Mood", mood.mood),
                        y: .value("Time", mood.date)
                    )
                    .foregroundStyle(Color.blue.gradient)
                    .annotation {
                        Text("Mood Swings")
                    }
                }
            }.frame(height: 400, alignment: .center)
            
        }.padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(15, antialiased: true)
    }
    
    var moodTypeChart: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Mood Types")
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                Text("Major mood type, your child had")
                    .font(.system(size: 16, weight: .light, design: .rounded))
                    .foregroundColor(.yellow)
            }
            
            Chart {
                ForEach(moodCountData.sorted{$0.value > $1.value }, id: \.key) { mood, count in
                    BarMark(
                        x: .value("Mood", mood),
                        y: .value("Time", count)
                    )
                    .foregroundStyle(Color.yellow.gradient)
                    .annotation {
                        Text(mood)
                    }
                }
            }.frame(height: 400, alignment: .center)
        }.padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(15, antialiased: true)  
    }
    
    // MARK:-  whelmenessChart
    var whelmenessChart: some View {
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading) {
                Text("Whelmeness")
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                Text("Overwhelmeness your child had")
                    .font(.system(size: 16, weight: .light, design: .rounded))
                    .foregroundColor(.green)
            }
            
            Chart {
                ForEach(whelmenessCountData.sorted{$0.value > $1.value }, id: \.key) { mood, count in
                    BarMark(
                        x: .value("Mood", mood),
                        y: .value("Time", count)
                    )
                    .foregroundStyle(Color.green.gradient)
                    .annotation {
                        Text("\(count)")
                    }
                }
            }.frame(height: 400, alignment: .center)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15, antialiased: true)
    }
}


struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
