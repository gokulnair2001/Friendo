import SwiftUI

@main
struct MyApp: App {
    
    @AppStorage("isShowingOnboardingView") var isShowingOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            TabView {
                
                TasksView()
                    .tabItem {
                        Label("Tasks", systemImage: "brain")
                    }
                
                FunzoneView()
                    .tabItem {
                        Label("Play", systemImage: "figure.play")
                    }
                
                StatisticsView()
                    .tabItem {
                        Label("Statistics", systemImage: "chart.bar")
                    }
                
            }.preferredColorScheme(.dark)
            .fullScreenCover(isPresented:  $isShowingOnboarding, content: {
                ContentView(isShowing: $isShowingOnboarding)
            })
        }
    }
}
