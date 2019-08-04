//
//  ToDoItemViewController.swift
//  ToDoListMVVMC
//
//  Created by James Haville on 04/08/2019.
//  Copyright © 2019 Ten Labs. All rights reserved.
//

import UIKit

final class ToDoItemViewController: UIViewController {
    
    private let viewModel: ToDoItemViewModel
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let verticalStackView = UIStackView()
    
    
    init(viewModel: ToDoItemViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.finishedShowing()
    }
    
    private func setupViews() {
        
        [verticalStackView, titleLabel, descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        verticalStackView.axis = .vertical
        verticalStackView.layoutMargins = .init(top: ViewConstants.defaultMargin, left: ViewConstants.defaultMargin, bottom: ViewConstants.defaultMargin, right: ViewConstants.defaultMargin)
        verticalStackView.isLayoutMarginsRelativeArrangement = true
        verticalStackView.spacing = 10

        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        titleLabel.text = viewModel.titleText
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        titleLabel.numberOfLines = 0
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.text = viewModel.descriptionText
        descriptionLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        descriptionLabel.setContentHuggingPriority(.required, for: .vertical)
        descriptionLabel.numberOfLines = 0
        
        view.backgroundColor = .white
    
    }
    
    private func setupHierarchy() {
        
        view.addSubview(verticalStackView)
        [titleLabel, descriptionLabel].forEach {
            verticalStackView.addArrangedSubview($0)
        }
        
    }
    
    private func setupConstraints() {
        verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
}
