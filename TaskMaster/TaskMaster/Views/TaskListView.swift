//
//  TaskListView.swift
//  TaskMaster
//
//  Created by Nick Perkins on 12/14/23.
//

import SwiftUI

struct TaskListView: View {
    let title: String
    @Binding var tasks: [Task]
    
    @State private var inspectorIsVisible: Bool = false
    @State private var selectedTask: Task? = nil
    
    var body: some View {
        List($tasks) { $task in
            TaskView(task: $task, selectedTask: $selectedTask, inspectorIsVisible: $inspectorIsVisible)
        }
        .navigationTitle(title)
        .toolbar {
            ToolbarItemGroup {
                Button(action: {
                    tasks.append(Task(title: "New task"))
                }, label: {
                    Label("Add New Task", systemImage: "plus")
                })
                
                Button(action: {
                    inspectorIsVisible.toggle()
                }, label: {
                    Label("View Inspector", systemImage: "sidebar.right")
                })
            }
        }
        .inspector(isPresented: $inspectorIsVisible) {
            Group {
                if let selectedTask {
                    Text(selectedTask.title)
                        .font(.title)
                } else {
                    Text("No details to show")
                }
            }
            .frame(minWidth: 100, maxWidth: .infinity)
        }
    }
}

#Preview {
    TaskListView(title: "All", tasks: .constant(Task.examples()))
}
