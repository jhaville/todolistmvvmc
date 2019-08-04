//
//  ToDoListDataSource.swift
//  ToDoListMVVMC
//
//  Created by James Haville on 03/08/2019.
//  Copyright © 2019 Ten Labs. All rights reserved.
//

import UIKit

final class ToDoListDataSource: NSObject {
    private var viewModel: ToDoListViewModel
    var tableView: UITableView? {
        didSet {
            tableView?.delegate = self
            tableView?.dataSource = self
            tableView?.sectionHeaderHeight = UITableView.automaticDimension
        }
    }

    init(viewModel: ToDoListViewModel) {
        self.viewModel = viewModel
        super.init()
        viewModel.delegate = self
    }
}

extension ToDoListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDoItemCell = tableView.dequeueReusableCell(withIdentifier: ToDoItemCellView.identifier, for: indexPath) as! ToDoItemCellView
        toDoItemCell.selectionStyle = .none
        toDoItemCell.delegate = self
        toDoItemCell.update(with: viewModel.toDoItemViewModels[indexPath.row])
        return toDoItemCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.toDoItemViewModels.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return ToDoTableHeaderView()
    }
}

extension ToDoListDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.tappedMoreDetails(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        viewModel.tappedDelete(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension ToDoListDataSource: ToDoListViewModelDelegate, ToDoItemCellViewDelegate {
    func toDoListViewModel(_ viewModel: ToDoListViewModel, didUpdateToDoItemViewModelAtIndexPath IndexPath: IndexPath) {
        tableView?.reloadRows(at: [IndexPath], with: .automatic)
    }
    
    func toDoListViewModelDidUpdate(_ viewModel: ToDoListViewModel) {
        tableView?.reloadData()
    }
    
    func toDoItemCellViewDidTapStatusView(_ cell: UITableViewCell) {
        if let indexPath = tableView?.indexPath(for: cell) {
            viewModel.tappedStatus(at: indexPath)
        }
    }
    
    func toDoItemCellViewDidTapMoreDetails(_ cell: UITableViewCell) {
        if let indexPath = tableView?.indexPath(for: cell) {
            viewModel.tappedMoreDetails(at: indexPath)
        }
    }
}


