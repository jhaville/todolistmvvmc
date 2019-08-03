//
//  ToDoItem.swift
//  ToDoListMVVMC
//
//  Created by James Haville on 03/08/2019.
//  Copyright © 2019 Ten Labs. All rights reserved.
//

import Foundation

struct ToDoItem {
    private(set) var title: String
    private(set) var description: String
    private(set) var isCompleted: Bool
}

extension ToDoItem {
    mutating func setCompleted(_ completed: Bool) {
        isCompleted = completed
    }
}
