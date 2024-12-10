
//SwiftUI Basics
import SwiftUI

struct ContentView: View {
    let colorList1: [Color] = [.red, .purple, .green, .pink]
    let colorList2: [Color] = [.black, .white, .blue]

    @State private var screenTapped: Bool = false
    @State private var offsetY: CGFloat = -1000.0
    
    var colors: [Color] {
        return screenTapped ? colorList1 : colorList2
    }
 
    var body: some View {
        ZStack {
            // Background color
            LinearGradient(
                colors: colors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .opacity(0.3)
            .ignoresSafeArea()
            
            Text("SwiftUI Basics")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .offset(y: offsetY)
        }
        .onTapGesture {
            withAnimation(.easeIn(duration: 0.5)) {
                screenTapped.toggle()
                offsetY = screenTapped ? 0 : -1000
            }
        }
    }
}

#Preview {
    ContentView()
}
