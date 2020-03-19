//
//  UserDescriptiveCell.swift
//  SampleTapsyrApp
//
//  Created by Abai Kalikov on 3/20/20.
//  Copyright © 2020 Abai Kalikov. All rights reserved.
//

import UIKit
import SnapKit

class UserDescriptiveCell: UITableViewCell {
    
    // MARK: - UIElements
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Номер телефона"
        label.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "+7 (122) 333 44 55"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    // MARK: - Method
    func configure(with model: ProfileModel) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
    }
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Configure view methods
extension UserDescriptiveCell {
    func setupViews() {
        selectionStyle = .none
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        [titleLabel, descriptionLabel].forEach { (views) in
            addSubview(views)
        }
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.left.right.equalToSuperview().inset(16)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.left.right.bottom.equalToSuperview().inset(16)
        }
    }
}

