import SwiftUI
import LinkPresentation


struct ViedeosListView: View {
    
    var body: some View {
        
        WarningScreen(image: "sorryImage", title: "Not supported now, since the app needs to be offline and adding raw files will consume memory. \n\n Stories and Facts are available, check that!", actionButtonVisible: false, isShowing: .constant(true))
            .frame(width: 300, height: 420, alignment: .center)
    }
}

struct ViedeosListView_Previews: PreviewProvider {
    static var previews: some View {
        ViedeosListView()
    }
}
