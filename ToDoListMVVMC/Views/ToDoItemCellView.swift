//
//  ToDoItemCellView.swift
//  ToDoListMVVMC
//
//  Created by James Haville on 03/08/2019.
//  Copyright © 2019 Ten Labs. All rights reserved.
//

import UIKit

final class ToDoItemCellView: UITableViewCell {
    
    static let identifier = "ToDoItemCellView"
    
    let titleLabel = UILabel()
    let viewDetailsButton = UIButton()
    let chevronImageView = UIImageView()
    let statusContainerView = UIView()
    let statusImageView = UIImageView()
    let horizontalStackView = UIStackView()
    let verticalStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        [titleLabel, viewDetailsButton, statusContainerView, statusImageView, verticalStackView, horizontalStackView, chevronImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [titleLabel].forEach {
            $0.numberOfLines = 0
        }
        
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        
        viewDetailsButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        viewDetailsButton.setTitle("View Details", for: .normal)
        viewDetailsButton.setTitleColor(.black, for: .normal)
        viewDetailsButton.semanticContentAttribute = .forceRightToLeft
        viewDetailsButton.tintColor = .black

        let chevronImage = #imageLiteral(resourceName: "right-chevron").withRenderingMode(.alwaysTemplate)
        viewDetailsButton.setImage(chevronImage, for: .normal)

        verticalStackView.alignment = .leading
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 5
        verticalStackView.layoutMargins = .init(top: 5, left: 0, bottom: 5, right: 0)
        verticalStackView.isLayoutMarginsRelativeArrangement = true

        verticalStackView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        verticalStackView.setContentCompressionResistancePriority(.required, for: .horizontal)

        statusContainerView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        statusContainerView.setContentHuggingPriority(.required, for: .horizontal)

    }
    
    private func setupHierarchy() {
        contentView.addSubview(horizontalStackView)
        
        [titleLabel, viewDetailsButton].forEach {
            verticalStackView.addArrangedSubview($0)
        }

        verticalStackView.addSubview(chevronImageView)
        statusContainerView.addSubview(statusImageView)
        
        [verticalStackView, statusContainerView].forEach {
            horizontalStackView.addArrangedSubview($0)
        }
    }
    
    private func setupConstraints() {
        horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ViewConstants.defaultMargin).isActive = true
        horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ViewConstants.defaultMargin).isActive = true

        statusImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        statusImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        statusImageView.trailingAnchor.constraint(equalTo: statusContainerView.trailingAnchor, constant: -ViewConstants.defaultMargin).isActive = true
        statusImageView.leadingAnchor.constraint(equalTo: statusContainerView.leadingAnchor, constant: ViewConstants.defaultMargin).isActive = true
        statusImageView.centerYAnchor.constraint(equalTo: statusContainerView.centerYAnchor).isActive = true
    }
    
    func update(with viewModel: ToDoItemViewModel) {
        titleLabel.text = viewModel.titleText
        statusImageView.image = UIImage(named: viewModel.imageName)
    }
}
