import Foundation

// Part G – Option D: Priority enum
enum Priority: String {
    case high = "High"
    case medium = "Medium"
    case low = "Low"
}

// Part A – Task Model
struct TaskItem: Identifiable {

    let id = UUID()

    var title: String
    var completed: Bool
    var priority: Priority = .medium
}
