
import Foundation
import Combine

class TaskStore: ObservableObject {
    @Published var prioritizedTasks = [
        PrioritizedTasks(
            priority: .high,
            names: [
                "Learn to make baklava",
                "Pick up heavy things and put them down",
            ]
        ),
        PrioritizedTasks(
            priority: .medium,
            names: [
                "Book an escape room",
                "Present at iOS meetup group",
                "Play disc golf in every state"
            ]
        ),
        PrioritizedTasks(
            priority: .low,
            names: [
                "Make karaoke playlist",
                "Code a SwiftUI app"
            ]
        ),
        PrioritizedTasks(
            priority: .no,
            names: [
                "Walk the cat",
                "Climb El Capitan",
                "100 movie reboot marathon"
            ]
        )
    ]
    
    func getIndex(for priority: Task.Priority) -> Int {
        prioritizedTasks.firstIndex {
            $0.priority == priority
        }!
    }
}

private extension TaskStore.PrioritizedTasks {
    init(priority: Task.Priority, names: [String]) {
        self.init(
            priority: priority,
            tasks: names.map {
                Task(name: $0)
            }
        )
    }
}
