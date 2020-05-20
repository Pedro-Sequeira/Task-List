
import SwiftUI

struct NewTaskView: View {
    
    var taskStore: TaskStore
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var taskName = ""
    @State var taskPriority = Task.Priority.no
    
    var body: some View {
        Form {
            TextField("Task Name", text: $taskName)
            
            VStack {
                
                Text("Priority")
                
                Picker("Priority", selection: $taskPriority.caseIndex) {
                    ForEach(Task.Priority.allCases.indices) { priorityIndex in
                        Text(Task.Priority.allCases[priorityIndex].rawValue.capitalized)
                        .tag(priorityIndex)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Button("Add") {
                let priorityIndex = self.taskStore.getIndex(for: self.taskPriority)
                self.taskStore.prioritizedTasks[priorityIndex].tasks.append(
                    Task(name: self.taskName)
                )
                self.presentationMode.wrappedValue.dismiss()
            }
            .disabled(taskName.isEmpty)
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(taskStore: TaskStore())
    }
}
