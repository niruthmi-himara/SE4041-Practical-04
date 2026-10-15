import SwiftUI

// Exercise 05 – TextField and Binding + Mini Activity
struct Ex05_TextFieldBinding: View {

    @State private var name = ""
    @State private var studentName = ""
    @State private var mark = ""

    var body: some View {
        VStack(spacing: 20) {

            Text("Student Registration")
                .font(.title)
                .bold()

            TextField("Enter student name", text: $name)
                .textFieldStyle(.roundedBorder)

            if name.isEmpty {
                Text("Enter your name above")
            } else {
                Text("Welcome, \(name)")
            }

            Divider()

            // Mini Activity – Student Result Input
            TextField("Student Name", text: $studentName)
                .textFieldStyle(.roundedBorder)

            TextField("Mark", text: $mark)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)

            Button("Show Result") {
                // No action required yet
            }
        }
        .padding()
    }
}

#Preview { Ex05_TextFieldBinding() }
