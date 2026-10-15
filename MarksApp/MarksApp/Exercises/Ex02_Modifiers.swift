import SwiftUI

// Exercise 02 – View Modifiers (+ modifier-order experiment)
struct Ex02_Modifiers: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Welcome to SE4041")
                .font(.title)
                .bold()
                .foregroundStyle(.blue)
                .padding()

            // padding first: the orange background includes the padding
            Text("SE4041")
                .padding()
                .background(.orange)

            // background first: the orange only covers the text
            Text("SE4041")
                .background(.orange)
                .padding()
        }
    }
}

#Preview { Ex02_Modifiers() }
