//
//  TaskMasterApp.swift
//  TaskMaster
//
//  Created by Nick Perkins on 12/14/23.
//

import SwiftUI

@main
struct TaskMasterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandMenu("Task") {
                Button("Add New Task") {
                    
                }
                .keyboardShortcut(KeyEquivalent("r"), modifiers: .command)
            }
            
            CommandGroup(after: .newItem) {
                Button("Add New Group") {
                    
                }
            }
        }
    }
}
