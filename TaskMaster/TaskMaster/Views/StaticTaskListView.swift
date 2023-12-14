//
//  TaskListView.swift
//  TaskMaster
//
//  Created by Nick Perkins on 12/14/23.
//

import SwiftUI

struct StaticTaskListView: View {
    
    let title: String
    var tasks: [Task]
    
    var body: some View {
        List(tasks) { task in
            HStack {
                Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                Text(task.title)
            }
        }
    }
}

#Preview {
    StaticTaskListView(title: "All", tasks: Task.examples())
}
