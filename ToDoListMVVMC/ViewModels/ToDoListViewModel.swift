//
//  ToDoListViewModel.swift
//  ToDoListMVVMC
//
//  Created by James Haville on 03/08/2019.
//  Copyright © 2019 Ten Labs. All rights reserved.
//

import Foundation

protocol ToDoListViewModelDelegate: class {
    func toDoListViewModel(_ viewModel: ToDoListViewModel, didUpdateToDoItemViewModelAtIndexPath IndexPath: IndexPath)
    func toDoListViewModelDidUpdate(_ viewModel: ToDoListViewModel)

}

final class ToDoListViewModel {
    let listTitle: String
    private(set) var toDoItemViewModels: [ToDoItemViewModel]
    weak var delegate: ToDoListViewModelDelegate?
    
    init(listTitle: String, toDoItems: [ToDoItem]) {
        self.listTitle = listTitle
        self.toDoItemViewModels = toDoItems.map(ToDoItemViewModel.init)
    }
    
    func tappedToDoItemViewModel(at indexPath: IndexPath) {
        toDoItemViewModels[indexPath.row].toggledCompleted()
        delegate?.toDoListViewModel(self, didUpdateToDoItemViewModelAtIndexPath: indexPath)
    }
    
    func tappedDelete(at indexPath: IndexPath) {
        toDoItemViewModels.remove(at: indexPath.row)
        delegate?.toDoListViewModelDidUpdate(self)
        
    }
}
