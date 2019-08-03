//
//  ToDoListCoordinator.swift
//  ToDoListMVVMC
//
//  Created by James Haville on 03/08/2019.
//  Copyright © 2019 Ten Labs. All rights reserved.
//

import Foundation

final class ToDoListCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    
    func start() {}
}
