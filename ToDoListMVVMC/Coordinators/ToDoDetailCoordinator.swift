//
//  ToDoDetailCoordinator.swift
//  ToDoListMVVMC
//
//  Created by James Haville on 03/08/2019.
//  Copyright © 2019 Ten Labs. All rights reserved.
//

import UIKit

protocol ToDoDetailCoordinatorDelegate: class {
    func toDoDetailCoordinatorDidFinish(_ coordinator: ToDoDetailCoordinator)
}

final class ToDoDetailCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    private let viewModel: ToDoItemViewModel
    private(set) var childCoordinators: [Coordinator] = []
    weak var coordinatorDelegate: ToDoDetailCoordinatorDelegate?
    
    init(navigationController: UINavigationController, viewModel: ToDoItemViewModel) {
        self.navigationController = navigationController
        self.viewModel = viewModel
    }
    
    func start() {
        let toDoItemViewController = ToDoItemViewController(viewModel: viewModel)
        viewModel.coordinatorDelegate = self
        navigationController.pushViewController(toDoItemViewController, animated: true)
    }
}

extension ToDoDetailCoordinator: ToDoItemViewModelCoordinatorDelegate {
    func toDoItemViewModelDidFinishShowing(_ viewModel: ToDoItemViewModel) {
        coordinatorDelegate?.toDoDetailCoordinatorDidFinish(self)
    }
}
