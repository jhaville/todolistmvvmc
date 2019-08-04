//
//  ToDoItemViewModel.swift
//  ToDoListMVVMC
//
//  Created by James Haville on 03/08/2019.
//  Copyright © 2019 Ten Labs. All rights reserved.
//

protocol ToDoItemViewModelCoordinatorDelegate: class {
    func toDoItemViewModelDidFinishShowing(_ viewModel: ToDoItemViewModel)
}

final class ToDoItemViewModel {
    private(set) var titleText: String
    private(set) var descriptionText: String
    private(set) var isCompleted: Bool
    
    weak var coordinatorDelegate: ToDoItemViewModelCoordinatorDelegate?
    
    var imageName: String {
        return isCompleted ? "circle-filled" : "circle"
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
    
    func finishedShowing() {
        coordinatorDelegate?.toDoItemViewModelDidFinishShowing(self)
    }
}

