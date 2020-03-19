//
//  ProfileTableView.swift
//  SampleTapsyrApp
//
//  Created by Abai Kalikov on 3/20/20.
//  Copyright © 2020 Abai Kalikov. All rights reserved.
//

import UIKit
class ProfileTableView: UITableView {
    
    // MARK: - Methods
    private func configure(with delegate: (UITableViewDataSource & UITableViewDelegate)?) {
        self.tableFooterView = UIView()
        self.showsVerticalScrollIndicator = false
        self.alwaysBounceVertical = true
        self.contentInsetAdjustmentBehavior = .never
        self.separatorColor = UIColor(hexString: "#E5EDFE")
        self.dataSource = delegate
        self.delegate = delegate
        self.register(UserDescriptiveCell.self, forCellReuseIdentifier: "UserDescriptiveCell")
        self.register(UserHeaderCell.self, forCellReuseIdentifier: "UserHeaderCell")
    }
    
    // MARK: - Initializers
    init(delegate: (UITableViewDataSource & UITableViewDelegate)?) {
        super.init(frame: .zero, style: .plain)
        configure(with: delegate)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
