import SwiftUI

// Part F – Task Detail Screen
struct TaskDetailView: View {

    let task: TaskItem

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {

                Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                    .font(.largeTitle)
                    .foregroundStyle(task.completed ? Color.green : Color.gray)

                Text(task.title)
                    .font(.headline)
                    .multilineTextAlignment(.center)

                Text(task.completed ? "Completed" : "Pending")
                    .font(.caption)

                // Part G – Option D: priority
                Label("\(task.priority.rawValue) Priority", systemImage: "flag.fill")
                    .font(.caption2)
                    .foregroundStyle(.orange)
            }
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("Details")
    }
}

#Preview {
    TaskDetailView(task: TaskItem(title: "Morning Walk", completed: true, priority: .high))
}
