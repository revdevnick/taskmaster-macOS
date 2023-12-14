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
    
    var body: some View {
        List($tasks) { $task in
            TaskView(task: $task)
        }
        .toolbar {
            Button(action: {
                tasks.append(Task(title: "New task"))
            }, label: {
                Label("Add New Task", systemImage: "plus")
            })
        }
    }
}

#Preview {
    TaskListView(title: "All", tasks: .constant(Task.examples()))
}
