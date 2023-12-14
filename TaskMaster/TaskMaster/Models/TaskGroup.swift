//
//  TaskGroup.swift
//  TaskMaster
//
//  Created by Nick Perkins on 12/14/23.
//

import Foundation

struct TaskGroup: Identifiable, Hashable {
    let id = UUID()
    var title: String
    let createionDate: Date
    var tasks: [Task]
    
    init(title: String, tasks: [Task] = []) {
        self.title = title
        self.createionDate = Date()
        self.tasks = tasks
    }
    
    static func example() -> TaskGroup {
        let task1 = Task(title: "Grab Starbucks Gift Cards")
        let task2 = Task(title: "Finish macOS app")
        let task3 = Task(title: "Make dentist appointment")
        
        var group = TaskGroup(title: "Personal")
        group.tasks = [task1, task2, task3]
        return group
    }
    
    static func examples() -> [TaskGroup] {
        let group1 = TaskGroup.example()
        let group2 = TaskGroup(title: "Business")
        return [group1, group2]
    }
}
