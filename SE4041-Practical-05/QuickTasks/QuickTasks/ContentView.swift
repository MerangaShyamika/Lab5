import SwiftUI

// Final Practical Task – Quick Tasks Watch App
struct ContentView: View {

    // Part B – Initial Tasks (stored with @State)
    @State private var tasks = [
        TaskItem(title: "Morning Walk", completed: true, priority: .high),
        TaskItem(title: "Drink Water", completed: false, priority: .high),
        TaskItem(title: "Read Notes", completed: false, priority: .medium),
        TaskItem(title: "Call Home", completed: true, priority: .low)
    ]

    // Part E – Completion Count (filter)
    private var completedCount: Int {
        tasks.filter { $0.completed }.count
    }

    // Part G – Option B: progress percentage
    private var progressPercent: Int {
        tasks.isEmpty ? 0 : completedCount * 100 / tasks.count
    }

    var body: some View {

        // Part C – Main Screen
        NavigationStack {
            List {

                // Summary at the top
                VStack(spacing: 4) {
                    Text("\(completedCount) / \(tasks.count) Completed")
                        .font(.headline)

                    Text("\(progressPercent)% Complete")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
                .listRowBackground(Color.clear)

                // Part D – Tap a task to toggle it
                Section("Tap to complete") {
                    ForEach(tasks.indices, id: \.self) { index in
                        Button {
                            tasks[index].completed.toggle()
                        } label: {
                            HStack {
                                Image(systemName: tasks[index].completed
                                      ? "checkmark.circle.fill"
                                      : "circle")
                                    .foregroundStyle(tasks[index].completed ? Color.green : Color.gray)

                                Text(tasks[index].title)

                                Spacer()
                            }
                        }
                    }
                }

                // Part F – Separate navigation links to the detail screen
                Section("Details") {
                    ForEach(tasks) { task in
                        NavigationLink {
                            TaskDetailView(task: task)
                        } label: {
                            Label(task.title, systemImage: "info.circle")
                        }
                    }
                }

                // Part G – Option A: reset all tasks
                Button(role: .destructive) {
                    for index in tasks.indices {
                        tasks[index].completed = false
                    }
                } label: {
                    Label("Reset Tasks", systemImage: "arrow.counterclockwise")
                }
            }
            .navigationTitle("Quick Tasks")
        }
    }
}

#Preview {
    ContentView()
}
