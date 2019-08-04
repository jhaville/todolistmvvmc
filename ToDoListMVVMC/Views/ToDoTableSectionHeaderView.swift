//
//  ToDoTableSectionHeaderView.swift
//  ToDoListMVVMC
//
//  Created by James Haville on 04/08/2019.
//  Copyright © 2019 Ten Labs. All rights reserved.
//

import UIKit

final class ToDoTableHeaderView: UIView {
    
    private let titleLabel = UILabel()
    private let completedLabel = UILabel()
    
    private let height: CGFloat = 50
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        [titleLabel, completedLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        titleLabel.text = "To Do Items"
        completedLabel.text = "Completed"
        backgroundColor = .groupTableViewBackground
    }
    
    private func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(completedLabel)
    }
    
    private func setupConstraints() {
        
        heightAnchor.constraint(equalToConstant: height).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewConstants.defaultMargin).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        completedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -ViewConstants.defaultMargin).isActive = true
        completedLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
