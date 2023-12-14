//
//  ContentView.swift
//  TaskMaster
//
//  Created by Nick Perkins on 12/14/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userGroups: [TaskGroup] = TaskGroup.examples()
    @State private var selection = TaskSection.all
    @State private var tasks = Task.examples()
    
    var body: some View {
        NavigationSplitView {
            SidebarView(userGroups: userGroups, selection: $selection)
        } detail: {
            switch selection {
            case .all:
                TaskListView(title: "All", tasks: tasks)
            case .done:
                TaskListView(title: "Done", tasks: tasks.filter({ $0.isCompleted }))
            case .upcoming:
                TaskListView(title: "Upcoming", tasks: tasks.filter({ !$0.isCompleted }))
            case .list(let taskGroup):
                TaskListView(title: taskGroup.title, tasks: taskGroup.tasks)
            }
        }
    }
}

#Preview {
    ContentView()
}
