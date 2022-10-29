//
//  TableView + Ext.swift
//  tableView
//
//  Created by Anıl AVCI on 27.10.2022.
//

import UIKit
extension UITableView {
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
