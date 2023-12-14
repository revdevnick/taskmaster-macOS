//
//  ContentView.swift
//  TaskMaster
//
//  Created by Nick Perkins on 12/14/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userGroups: [TaskGroup] = TaskGroup.examples()
    @State private var selection: TaskSection = TaskSection.all
    @State private var tasks = Task.examples()
    
    @State private var searchTerm: String = ""
    
    var body: some View {
        NavigationSplitView {
            SidebarView(userGroups: $userGroups, selection: $selection)
        } detail: {
            
            if searchTerm.isEmpty {
                switch selection {
                case .all:
                    TaskListView(title: "All", tasks: $tasks)
                case .done:
                    StaticTaskListView(title: "Done", tasks: tasks.filter({ $0.isCompleted }))
                case .upcoming:
                    StaticTaskListView(title: "Upcoming", tasks: tasks.filter({ !$0.isCompleted }))
                case .list(let taskGroup):
                    StaticTaskListView(title: taskGroup.title, tasks: taskGroup.tasks)
                }
            } else {
                StaticTaskListView(title: "All", tasks: tasks.filter({ $0.title.localizedCaseInsensitiveContains(searchTerm) }))
            }
        }
        .searchable(text: $searchTerm)
    }
}

#Preview {
    ContentView()
}
