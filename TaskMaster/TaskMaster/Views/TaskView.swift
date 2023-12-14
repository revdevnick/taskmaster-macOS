//
//  TaskView.swift
//  TaskMaster
//
//  Created by Nick Perkins on 12/14/23.
//

import SwiftUI

struct TaskView: View {
    
    @Binding var task: Task
    
    @Binding var selectedTask: Task?
    
    @Binding var inspectorIsVisible: Bool
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            TextField("New Task", text: $task.title)
                .textFieldStyle(.plain)
            Button(action: {
                inspectorIsVisible = true
                selectedTask = task
            }, label: {
                Text("More")
            })
        }
    }
}

#Preview {
    TaskView(task: .constant(Task.example()), selectedTask: .constant(nil), inspectorIsVisible: .constant(false))
        .padding()
}
