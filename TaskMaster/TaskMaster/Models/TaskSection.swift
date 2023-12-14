//
//  TaskSection.swift
//  TaskMaster
//
//  Created by Nick Perkins on 12/14/23.
//

import Foundation

enum TaskSection: Identifiable, CaseIterable, Hashable {
    
    case all, done, upcoming, list(TaskGroup)
    
    var id: String {
        switch self {
        case .all:
            return "all"
        case .done:
            return "done"
        case .upcoming:
            return "upcoming"
        case .list(let group):
            return group.id.uuidString
        }
    }
    
    var displayName: String {
        switch self {
        case .all:
            return "All"
        case .done:
            return "Done"
        case .upcoming:
            return "Upcoming"
        case .list(let group):
            return group.title
        }
    }
    
    var icon: String {
        switch self {
        case .all:
            return "star"
        case .done:
            return "checkmark.circle"
        case .upcoming:
            return "calendar"
        case .list(_):
            return "folder"
        }
    }
    
    static var allCases: [TaskSection] {
        return [.all, .done, .upcoming]
    }
    
    static func == (lhs: TaskSection, rhs: TaskSection) -> Bool {
        return lhs.id == rhs.id
    }
}
