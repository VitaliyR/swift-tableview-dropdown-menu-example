//
//  TableViewController.swift
//  test-tableview-dropdown-menu
//
//  Created by Vitaliy Ribachenko on 2/14/17.
//  Copyright © 2017 Vitaliy Ribachenko. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var data: [String]!
    
    override func viewDidLoad() {
        data = DateFormatter().standaloneMonthSymbols
        
        tableView.estimatedRowHeight = 40
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewDidLayoutSubviews() {
        tableView.contentInset = UIEdgeInsets(top: topLayoutGuide.length, left: 0, bottom: 0, right: 0)
    }
    
    func updateTableView() {
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
}

// MARK: - Table View Delegate and Data Source

extension TableViewController {
    
    enum cellIdentifiers: String {
        case cell = "cell"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers.cell.rawValue, for: indexPath) as! TableViewCell
        let item = data[indexPath.row]
        
        cell.label.text = item
        
        if tableView.indexPathForSelectedRow?.row == indexPath.row {
            cell.toggleSelected(true)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if tableView.indexPathForSelectedRow == indexPath {
            tableView.deselectRow(at: indexPath, animated: true)
            updateTableView()
            return nil
        }
        
        return indexPath
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        updateTableView()
        let cellRect = tableView.rectForRow(at: indexPath)
        if !tableView.bounds.contains(cellRect) {
            tableView.scrollToRow(at: indexPath, at: .none, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        updateTableView()
    }
    
}
