//
//  UserHeaderCell.swift
//  SampleTapsyrApp
//
//  Created by Abai Kalikov on 3/20/20.
//  Copyright © 2020 Abai Kalikov. All rights reserved.
//


import UIKit
import SnapKit

class UserHeaderCell: UITableViewCell {
    
    // MARK: - UIElements
    lazy var profileLabel: UILabel = {
        let label = UILabel()
        label.text = "Профиль"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        imageView.layer.borderWidth = 0.5
        return imageView
    }()
    
    lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Testovich Test"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(hexString: "#0AA8BA"), for: .normal)
        button.setTitle("Редактировать данные", for: .normal)
//        button.addTarget(self, action: #selector(editButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [fullNameLabel, editButton])
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = UIStackView.Distribution.fillProportionally
        return stackView
    }()
    
    // MARK: - Method
    func configure(with model: ProfileModel) {
        fullNameLabel.text = model.fullName
        imageView?.image = UIImage(named: model.image)
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
extension UserHeaderCell {
    func setupViews() {
        selectionStyle = .none
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        [profileLabel, profileImageView, stackView].forEach { (views) in
            addSubview(views)
        }
    }
    
    func setupConstraints() {
        profileLabel.snp.makeConstraints {
            $0.top.equalTo(40)
            $0.centerX.equalToSuperview()
        }
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(profileLabel.snp.bottom).offset(24)
            $0.left.bottom.equalToSuperview().inset(16)
            $0.size.equalTo(100)
        }
        
        stackView.snp.makeConstraints {
            $0.left.equalTo(profileImageView.snp.right)
            $0.right.equalTo(-10)
            $0.centerY.equalTo(profileImageView)
        }
    }
}
