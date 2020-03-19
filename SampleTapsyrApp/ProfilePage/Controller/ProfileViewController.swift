//
//  ProfileViewController.swift
//  SampleTapsyrApp
//
//  Created by Abai Kalikov on 3/20/20.
//  Copyright © 2020 Abai Kalikov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Enums
    enum RowType: String, CaseIterable {
        case fullName, phone, city, email
    }
    
    // MARK: - Views
    private lazy var profileTableView = ProfileTableView(delegate: self as? (UITableViewDataSource & UITableViewDelegate))
    
    // MARK: - Properties
    let rowTypes = RowType.allCases
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
}

// MARK: - Configure view methods
extension ProfileViewController {
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        view.addSubview(profileTableView)
    }
    
    private func setupConstraints() {
        profileTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
