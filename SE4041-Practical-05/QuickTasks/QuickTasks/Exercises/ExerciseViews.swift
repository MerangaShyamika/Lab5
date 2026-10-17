import SwiftUI

// Practical 05 guided exercises.
// The lab sheet replaces ContentView at each step; here every step is kept as its
// own view. Open this file and use the Xcode canvas previews (bottom of the file)
// to see each exercise, or temporarily put e.g. `Exercise03View()` inside
// WindowGroup in QuickTasksApp.swift to run it in the simulator.

// Exercise 01 – Your First Watch Interface
struct Exercise01View: View {
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "applewatch")
                .font(.title)

            Text("SE4041")
                .font(.headline)
                .bold()

            Text("watchOS")
                .font(.caption)
        }
    }
}

// Exercise 02 – Simple Layout
struct Exercise02View: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "figure.walk")
                .font(.largeTitle)
                .foregroundStyle(.green)

            Text("Daily Activity")
                .font(.headline)

            Text("5,240")
                .font(.title)
                .bold()

            Text("Steps")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

// Exercise 03 – @State and Button Interaction (+ Reset button)
struct Exercise03View: View {
    @State private var glasses = 0

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Image(systemName: "drop.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.blue)

                Text("Water")
                    .font(.headline)

                Text("\(glasses)")
                    .font(.largeTitle)
                    .bold()

                Text("Glasses")
                    .font(.caption)

                Button("Add") {
                    glasses += 1
                }

                Button("Reset") {
                    glasses = 0
                }
            }
        }
    }
}

// Exercise 04 – Improve the Controls with SF Symbols
struct Exercise04View: View {
    @State private var glasses = 0

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("\(glasses) Glasses")
                    .font(.title3)
                    .bold()

                Button {
                    glasses += 1
                } label: {
                    Label("Add Water", systemImage: "plus.circle.fill")
                }

                Button {
                    glasses = 0
                } label: {
                    Label("Reset", systemImage: "arrow.counterclockwise")
                }
            }
        }
    }
}

// Exercises 05 & 06 – Model and List
struct Exercise06View: View {
    @State private var tasks = [
        TaskItem(title: "Morning Walk", completed: true),
        TaskItem(title: "Drink Water", completed: false),
        TaskItem(title: "Read Notes", completed: false)
    ]

    var body: some View {
        List(tasks) { task in
            HStack {
                Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                Text(task.title)
            }
        }
    }
}

// Exercise 07 – Navigation
struct Exercise07View: View {
    @State private var tasks = [
        TaskItem(title: "Morning Walk", completed: true),
        TaskItem(title: "Drink Water", completed: false),
        TaskItem(title: "Read Notes", completed: false)
    ]

    var body: some View {
        NavigationStack {
            List(tasks) { task in
                NavigationLink {
                    TaskDetailView(task: task)
                } label: {
                    HStack {
                        Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                        Text(task.title)
                    }
                }
            }
            .navigationTitle("Tasks")
        }
    }
}

// Exercise 08 – Toggle Task Status + Completion Count
struct Exercise08View: View {
    @State private var tasks = [
        TaskItem(title: "Morning Walk", completed: true),
        TaskItem(title: "Drink Water", completed: false),
        TaskItem(title: "Read Notes", completed: false)
    ]

    private var completedCount: Int {
        tasks.filter { $0.completed }.count
    }

    var body: some View {
        VStack {
            Text("\(completedCount)/\(tasks.count) Completed")
                .font(.caption)

            List(tasks.indices, id: \.self) { index in
                Button {
                    tasks[index].completed.toggle()
                } label: {
                    HStack {
                        Image(systemName: tasks[index].completed ? "checkmark.circle.fill" : "circle")
                        Text(tasks[index].title)
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview("Exercise 01") { Exercise01View() }
#Preview("Exercise 02") { Exercise02View() }
#Preview("Exercise 03") { Exercise03View() }
#Preview("Exercise 04") { Exercise04View() }
#Preview("Exercise 06") { Exercise06View() }
#Preview("Exercise 07") { Exercise07View() }
#Preview("Exercise 08") { Exercise08View() }
