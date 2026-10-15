import SwiftUI

// Final Practical Task – SE4041 Marks
struct ContentView: View {

    @State private var students: [Student] = []
    @State private var studentName = ""
    @State private var markText = ""
    @State private var errorMessage = ""

    private var passedCount: Int {
        students.filter { $0.passed }.count
    }

    var body: some View {

        NavigationStack {

            VStack(spacing: 12) {

                // Part C – Input interface
                VStack(alignment: .leading, spacing: 10) {

                    Text("Student Name")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    TextField("Student Name", text: $studentName)
                        .textFieldStyle(.roundedBorder)

                    Text("Mark")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    TextField("Mark (0 - 100)", text: $markText)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)

                    if !errorMessage.isEmpty {
                        Label(errorMessage, systemImage: "exclamationmark.triangle.fill")
                            .font(.footnote)
                            .foregroundStyle(.red)
                    }

                    Button {
                        addStudent()
                    } label: {
                        Label("Add Student", systemImage: "person.badge.plus")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.horizontal)

                // Part G – Passed student count
                HStack {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundStyle(.green)
                    Text("Passed Students: \(passedCount)")
                        .font(.headline)
                    Spacer()
                    Text("Total: \(students.count)")
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)

                // Part E – Student list
                List {
                    if students.isEmpty {
                        Text("No students added yet")
                            .foregroundStyle(.secondary)
                    }

                    ForEach(students) { student in
                        // Part F – Navigation to detail
                        NavigationLink {
                            StudentDetailView(student: student)
                        } label: {
                            StudentRow(student: student)
                        }
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("SE4041 Marks")
        }
    }

    // Part D – Add a student with validation
    private func addStudent() {

        let name = studentName.trimmingCharacters(in: .whitespaces)

        guard !name.isEmpty else {
            errorMessage = "Please enter a student name."
            return
        }

        guard let mark = Int(markText.trimmingCharacters(in: .whitespaces)) else {
            errorMessage = "Mark must be a whole number."
            return
        }

        guard mark >= 0 && mark <= 100 else {
            errorMessage = "Mark must be between 0 and 100."
            return
        }

        students.append(Student(name: name, mark: mark))

        studentName = ""
        markText = ""
        errorMessage = ""
    }
}

// Reusable subview for one list row
struct StudentRow: View {

    let student: Student

    var body: some View {
        HStack {
            Text(student.name)

            Spacer()

            Text("\(student.mark)")
                .bold()
                .foregroundStyle(student.passed ? .green : .red)

            // Text label as well as colour, so the result is not colour-only
            Text(student.passed ? "Pass" : "Fail")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ContentView()
}
