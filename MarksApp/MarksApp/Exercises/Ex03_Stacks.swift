import SwiftUI

// Exercise 03 – Building Layouts with Stacks + SF Symbols
struct Ex03_Stacks: View {
    var body: some View {
        VStack(spacing: 20) {

            Image(systemName: "graduationcap.fill")
                .font(.system(size: 60))
                .foregroundStyle(.blue)

            Text("SE4041")
                .font(.largeTitle)
                .bold()

            Text("Mobile Application Design & Development")

            HStack {
                Text("Practical 04")
                Spacer()
                Text("SwiftUI")
            }
            .padding()

            HStack(spacing: 20) {
                Image(systemName: "person.fill")
                Image(systemName: "book.fill")
                Image(systemName: "star.fill")
                    .foregroundStyle(.orange)
            }
            .font(.largeTitle)
        }
        .padding()
    }
}

#Preview { Ex03_Stacks() }
