import SwiftUI

// Exercises 06 & 07 – Model (Student.swift) and List with pass/fail colours
struct Ex06_07_ModelAndList: View {

    @State private var students = [
        Student(name: "Amal", mark: 72),
        Student(name: "Nimali", mark: 45),
        Student(name: "Ruwan", mark: 58)
    ]

    var body: some View {
        List(students) { student in
            HStack {
                Text(student.name)
                Spacer()
                Text("\(student.mark)")
                    .bold()
                    .foregroundStyle(student.passed ? .green : .red)
            }
        }
    }
}

#Preview { Ex06_07_ModelAndList() }
