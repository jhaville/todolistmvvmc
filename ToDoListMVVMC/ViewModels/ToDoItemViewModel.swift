//
//  ToDoItemViewModel.swift
//  ToDoListMVVMC
//
//  Created by James Haville on 03/08/2019.
//  Copyright © 2019 Ten Labs. All rights reserved.
//

import Foundation

final class ToDoItemViewModel {
    private(set) var titleText: String
    private(set) var descriptionText: String
    private(set) var isCompleted: Bool
    var imageName: String {
        return isCompleted ? "" : ""
    }

    init(toDoItem: ToDoItem) {
        self.titleText = toDoItem.title
        self.descriptionText = toDoItem.description
        self.isCompleted = toDoItem.isCompleted
    }
    
    //MARK: User Actions
    
    func toggledCompleted() {
        self.isCompleted = !self.isCompleted
    }
}

