import SwiftUI

struct StudentDetailView: View {

    let student: Student

    var body: some View {

        VStack(spacing: 20) {

            Image(systemName: student.passed ? "person.crop.circle.badge.checkmark" : "person.crop.circle.badge.xmark")
                .font(.system(size: 80))
                .foregroundStyle(student.passed ? .green : .red)

            Text(student.name)
                .font(.largeTitle)
                .bold()

            Text("Mark: \(student.mark)")
                .font(.title2)

            Text("Grade: \(student.grade)")
                .font(.title3)

            Text(student.passed ? "PASS" : "FAIL")
                .font(.title)
                .bold()
                .foregroundStyle(student.passed ? .green : .red)

            Spacer()
        }
        .padding()
        .navigationTitle("Student Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        StudentDetailView(student: Student(name: "Amal", mark: 72))
    }
}
