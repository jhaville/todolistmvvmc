//
//  ToDoListViewModel.swift
//  ToDoListMVVMC
//
//  Created by James Haville on 03/08/2019.
//  Copyright © 2019 Ten Labs. All rights reserved.
//

import Foundation

protocol ToDoListViewModelDelegate: class {
    func toDoListViewModel(_ viewModel: ToDoListViewModel, didUpdateToDoItemViewModelAtIndexPath indexPath: IndexPath)
    func toDoListViewModelDidUpdate(_ viewModel: ToDoListViewModel)
}

protocol ToDoListViewModelCoordinatorDelegate: class {
    func toDoListViewModel(_ viewModel: ToDoListViewModel, didTapMoreDetailsForItemViewModel itemViewModel: ToDoItemViewModel)
}

final class ToDoListViewModel {
    let listTitle: String
    private(set) var toDoItemViewModels: [ToDoItemViewModel]
    weak var delegate: ToDoListViewModelDelegate?
    weak var coordinatorDelegate: ToDoListViewModelCoordinatorDelegate?
    
    init(listTitle: String, toDoItems: [ToDoItem]) {
        self.listTitle = listTitle
        self.toDoItemViewModels = toDoItems.map(ToDoItemViewModel.init)
    }
    
    func tappedStatus(at indexPath: IndexPath) {
        toDoItemViewModels[indexPath.row].toggledCompleted()
        delegate?.toDoListViewModel(self, didUpdateToDoItemViewModelAtIndexPath: indexPath)
    }
    
    func tappedDelete(at indexPath: IndexPath) {
        toDoItemViewModels.remove(at: indexPath.row)
        delegate?.toDoListViewModelDidUpdate(self)
    }
    
    func tappedMoreDetails(at indexPath: IndexPath) {
        coordinatorDelegate?.toDoListViewModel(self, didTapMoreDetailsForItemViewModel: toDoItemViewModels[indexPath.row])
    }
}
