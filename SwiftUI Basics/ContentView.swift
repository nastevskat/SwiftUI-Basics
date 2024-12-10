
import SwiftUI

struct ContentView: View {
    let colorList1: [Color] = [.red, .purple, .green, .pink]
    let colorList2: [Color] = [.black, .white, .blue]
    let rotationAngle: CGFloat = 360.0

    @State private var screenTapped: Bool = false

    var colors: [Color] {
        return screenTapped ? colorList1 : colorList2
    }
    var text: String {
        screenTapped ? "SwiftUI Basics" : "To know what you know and what you do not know, that is true knowledge. "
    }
    var font: Font {
        screenTapped ? .largeTitle : .title
    }
    var foregroundStyle: Color {
        screenTapped ? .green : .black
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
            // Text
            VStack {
                
                Text(text)
                    .font(font)
                    .fontWeight(.semibold)
                    .foregroundStyle(foregroundStyle)
                    .multilineTextAlignment(.center)
                    .frame(maxHeight: .infinity)
                    
                Text("Another line of text")
                    .font(font)
                    .fontWeight(.semibold)
                    .foregroundStyle(screenTapped ? .black : .blue)
                    .multilineTextAlignment(.center)
                    .frame(maxHeight: .infinity)
            }
            .padding(.horizontal)
            .rotation3DEffect(.degrees(screenTapped ? 0 : rotationAngle), axis: (x: 0, y: 1, z: 1))
        }
        .onTapGesture {
            withAnimation(.easeIn(duration: 0.5)) {
                screenTapped.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
