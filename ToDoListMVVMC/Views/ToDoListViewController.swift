//
//  ViewController.swift
//  ToDoListMVVMC
//
//  Created by James Haville on 03/08/2019.
//  Copyright © 2019 Ten Labs. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController {

    let toDoListViewModel: ToDoListViewModel
    let toDoListDataSource: ToDoListDataSource
    let toDoListTableView: UITableView

    init(toDoListViewModel: ToDoListViewModel, dataSource: ToDoListDataSource) {
        self.toDoListViewModel = toDoListViewModel
        self.toDoListDataSource = dataSource
        self.toDoListTableView = UITableView()
        super.init(nibName: nil, bundle: nil)
        dataSource.tableView = toDoListTableView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupViews() {
        toDoListTableView.translatesAutoresizingMaskIntoConstraints = false
        toDoListTableView.tableFooterView = UIView()
        toDoListTableView.register(ToDoItemCellView.self, forCellReuseIdentifier: ToDoItemCellView.identifier)
        navigationItem.title = toDoListViewModel.listTitle
    }
    
    private func setupHierarchy() {
        view.addSubview(toDoListTableView)
    }
    
    private func setupConstraints() {
        toDoListTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        toDoListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        toDoListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        toDoListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
