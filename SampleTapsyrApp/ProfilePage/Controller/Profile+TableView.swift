//
//  Profile+TableView.swift
//  SampleTapsyrApp
//
//  Created by Abai Kalikov on 3/20/20.
//  Copyright © 2020 Abai Kalikov. All rights reserved.
//

import UIKit

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowTypes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch rowTypes[indexPath.row] {
        case .phone, .city, .email:
            let cell: UserDescriptiveCell = tableView.dequeueReusableCell(withIdentifier: "UserDescriptiveCell", for: indexPath) as! UserDescriptiveCell
            cell.configureItems(with: ProfileCellModel(rowType: rowTypes[indexPath.row], data: profileData!))
            return cell
        case .fullName:
            let cell: UserHeaderCell = tableView.dequeueReusableCell(withIdentifier: "UserHeaderCell", for: indexPath) as! UserHeaderCell
            cell.configureItems(with: ProfileCellModel(rowType: rowTypes[indexPath.row], data: profileData!))
            return cell
        }
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
