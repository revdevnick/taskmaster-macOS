//
//  Task.swift
//  TaskMaster
//
//  Created by Nick Perkins on 12/14/23.
//

import Foundation

struct Task: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
    var dueDate: Date
    var notes: String?
    
    init(title: String, isCompleted: Bool = false, dueDate: Date = Date(), notes: String? = nil) {
        self.title = title
        self.isCompleted = isCompleted
        self.dueDate = dueDate
        self.notes = notes
    }
    
    static func example() -> Task {
        Task(title: "Get milk", dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!)
    }
    
    static func examples() -> [Task] {
        [
            Task(title: "Buy new M3 Max Macbook"),
            Task(title: "Grab batteries at Wal-mart", isCompleted: true),
            Task(title: "Create a daily schedule for the week"),
            Task(title: "Organize my workspace for increased productivity", isCompleted: true),
            Task(title: "Take a 30-minute walk or engage in some form of exercise", dueDate: Calendar.current.date(byAdding: .day, value: 1,
            to: Date())!),
            Task(title: "Plan and prepare a healthy meal"),
            Task(title: "Read a chapter from the book of Romans and spend sometime journaling what God is saying to me about it and how to take action on what He has said.", isCompleted: true, dueDate: Calendar.current.date( byAdding: .day, value: 4, to: Date())!),
            Task(title: "Review my finances and setup my budget for the next 3 months."),
            Task(title: "Update my resume and LinkedIn profile", isCompleted: true, dueDate: Calendar.current.date(byAdding: .day, value: 2,
            to: Date())!),
            Task(title: "Finish cleaning up the garage and organizing the tools into a new tool chest."),
            Task(title: "Set a specific, achievable goals for the month"),
            Task(title: "Learn a new skill or hobby."),
            Task(title: "Plan and prepare a healthy meal.", isCompleted: true, dueDate: Calendar.current.date( byAdding: .day, value: 4, to: Date())!),
            Task(title: "Practice being present with God as I pray for 10 minutes."),
            Task(title: "Reach out to a friend or family member you haven't spoken to in a while.", isCompleted: true, dueDate: Calendar.current.date(byAdding: .day, value: 2,
            to: Date())!),
            Task(title: "Declutter a specific area of your living space."),
            Task(title: "Set aside time for a creative activity, such as drawing or writing."),
            Task(title: "Volunteer or find a way to give back to your community.", isCompleted: true, dueDate: Calendar.current.date(byAdding: .day, value: 2,
            to: Date())!),
            Task(title: "Set up a goal-tracking system."),
            Task(title: "Take a digital detox for a specified period.")
        ]
    }
}
