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
        
        WindowGroup("Special Window") {
            Text("Special window")
                .frame(minWidth: 200, idealWidth: 300, minHeight: 200)
        }
        .defaultPosition(.leading)
        
        Settings {
            Text("Settings")
                .frame(minWidth: 500, maxWidth: .infinity, minHeight: 600, maxHeight: .infinity)
        }
        
        MenuBarExtra("TaskMaster") {
            Button(action: {
                
            }, label: {
                Text("Do something awesome!")
            })
        }
    }
}
