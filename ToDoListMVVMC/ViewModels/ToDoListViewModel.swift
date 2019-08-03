//
//  ToDoListViewModel.swift
//  ToDoListMVVMC
//
//  Created by James Haville on 03/08/2019.
//  Copyright © 2019 Ten Labs. All rights reserved.
//

import Foundation

final class ToDoListViewModel {
    let listTitle: String
    let toDoItemViewModels: [ToDoItemViewModel]
    
    init(listTitle: String, toDoItems: [ToDoItem]) {
        self.listTitle = listTitle
        self.toDoItemViewModels = toDoItems.map(ToDoItemViewModel.init)
    }
}
