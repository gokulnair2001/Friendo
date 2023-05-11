import Foundation

struct MoodModel {
    var id = UUID()
    
    let date: Date
    let mood: String
    let scores: Int
}

struct WhelmenessModel {
    var id = UUID()
    
    let date: Date
    let whelmeness: String
}

class Store {
    static let shared = Store()
    
    private init() {}
    
    /* Static variables are used,
    since this is a basic app, I dont want to add too many App Defaults */
    var moods:[MoodModel] = []
    var whelmeness:[WhelmenessModel] = []
    var totalRewards: Int = 30
    var totalGames: Int = 0
    
    func getOccourances() -> [String: Int] {
        let arr = moods.map({ $0.mood })
        return arr.reduce(into: [:]) { counts, mood in counts[mood, default: 0] += 1 }
    }
    
    func getWhelmenessOccourances() -> [String: Int] {
        let arr = whelmeness.map({ $0.whelmeness })
        return arr.reduce(into: [:]) { counts, mood in counts[mood, default: 0] += 1 }
    }
    
    func getMoodScore() -> Int {
        var totalScore: Int = 0
        
        moods.forEach { mood in
            totalScore += mood.scores
        }
        
        return totalScore
    }
    
    func getWhelmenessScore() -> Int {
        var totalScore: Int = 0
        
        whelmeness.forEach { item in
            totalScore += (Int(item.whelmeness) ?? 0)
        }
        
        return totalScore
    }
}
