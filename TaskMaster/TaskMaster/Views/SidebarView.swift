//
//  SidebarView.swift
//  TaskMaster
//
//  Created by Nick Perkins on 12/14/23.
//

import SwiftUI

struct SidebarView: View {
    
    let userGroups: [TaskGroup]
    @Binding var selection: TaskSection
    
    var body: some View {
        List(selection: $selection) {
            Section("Favorites") {
                ForEach(TaskSection.allCases) { section in
                    Label(section.displayName, systemImage: section.icon)
                        .tag(section)
                }
            }
            
            Section("My Groups") {
                ForEach(userGroups) { group in
                    Label(group.title, systemImage: "folder")
                        .tag(TaskSection.list(group))
                }
            }
        }
    }
}

#Preview {
    SidebarView(userGroups: TaskGroup.examples(), selection: .constant(.all))
        .listStyle(.sidebar)
}
