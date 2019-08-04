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
    private(set) var navigationController: UINavigationController?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let toDoListViewModel = ToDoListViewModel(listTitle: "To Do List", toDoItems: ToDoItem.testData)
        toDoListViewModel.coordinatorDelegate = self
        let toDoListDataSource = ToDoListDataSource(viewModel: toDoListViewModel)
        let toDoListViewController = ToDoListViewController(toDoListViewModel: toDoListViewModel, dataSource: toDoListDataSource)
        navigationController = UINavigationController(rootViewController: toDoListViewController)
        navigationController?.navigationBar.tintColor = .black
        window.rootViewController = navigationController
    }
}

extension ToDoListCoordinator: ToDoListViewModelCoordinatorDelegate {
    func toDoListViewModel(_ viewModel: ToDoListViewModel, didTapMoreDetailsForItemViewModel itemViewModel: ToDoItemViewModel) {
        if let navigationController = navigationController {
            let toDoDetailCoordinator = ToDoDetailCoordinator(navigationController: navigationController, viewModel: itemViewModel)
            childCoordinators.append(toDoDetailCoordinator)
            toDoDetailCoordinator.coordinatorDelegate = self
            toDoDetailCoordinator.start()
        }
    }
}

extension ToDoListCoordinator: ToDoDetailCoordinatorDelegate {
    func toDoDetailCoordinatorDidFinish(_ coordinator: ToDoDetailCoordinator) {
        print("did finish")
        childCoordinators.remove(at: childCoordinators.count - 1)
    }
}
