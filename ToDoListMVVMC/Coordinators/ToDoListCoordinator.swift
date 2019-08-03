//
//  ToDoListCoordinator.swift
//  ToDoListMVVMC
//
//  Created by James Haville on 03/08/2019.
//  Copyright © 2019 Ten Labs. All rights reserved.
//

import UIKit

final class ToDoListCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let toDoListViewModel = ToDoListViewModel(listTitle: "Weekend To Do List", toDoItems: ToDoItem.testData)
        let toDoListViewController = ToDoListViewController(toDoListViewModel: toDoListViewModel)
        window.rootViewController = toDoListViewController
    }
}
