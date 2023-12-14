//
//  SidebarView.swift
//  TaskMaster
//
//  Created by Nick Perkins on 12/14/23.
//

import SwiftUI

struct SidebarView: View {
    
    @Binding var userGroups: [TaskGroup]
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
                ForEach($userGroups) { $group in
                    HStack {
                        Image(systemName: "folder")
                        TextField("New Group", text: $group.title)
                    }
                    .tag(TaskSection.list(group))
                    .contextMenu {
                        Button("Delete", role: .destructive) {
                            if let index = userGroups.firstIndex(where: { $0.id == group.id }) {
                                userGroups.remove(at: index)
                            }
                        }
                    }
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            Button(action: {
                let newGroup = TaskGroup(title: "New Group")
                userGroups.append(newGroup)
            }, label: {
                Label("Add Group", systemImage: "plus.circle")
            })
            .buttonStyle(.borderless)
            .foregroundStyle(Color.accentColor)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .keyboardShortcut(KeyEquivalent("a"), modifiers: .command)
        }
        
    }
}

#Preview {
    SidebarView(userGroups: .constant(TaskGroup.examples()), selection: .constant(.all))
        .listStyle(.sidebar)
}
