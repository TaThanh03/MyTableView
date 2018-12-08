//
//  ViewController.swift
//  MyTableView
//
//  Created by TA Trung Thanh on 08/12/2018.
//  Copyright © 2018 TA Trung Thanh. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    //NO viewDidLoad()
    private var count = 1
    private var content = [[OneCell]]()
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        self.tableView.sectionHeaderHeight = 80.0
        self.tableView.separatorColor = .blue
        self.tableView.separatorStyle = .singleLine
        for _ in 1...2 { //because we don't use index
            var inSection = [OneCell]()
            for _ in 1...10 { //because index unused
                inSection += [OneCell(l: "Cell #\(count)", d: "Detail #\(count)")]
                count += 1
            }
            content += [inSection]
        }
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.title = "MyElements"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //TableViewDataSource protocol
    override func numberOfSections(in tableView: UITableView) -> Int {
        return content.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section + 1)"
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "End section \(section + 1)"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellId = ""
        if (indexPath as NSIndexPath).row % 2 == 1 {
            cellId = "odd"
        } else {
            cellId = "even"
        }
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell === nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
            if (indexPath as NSIndexPath).row % 2 == 1 {
                cell!.textLabel?.textColor = UIColor.red
            } else {
                cell!.textLabel?.textColor = UIColor.blue
            }
        }
        let cont = content[indexPath.section][indexPath.row]
        cell!.textLabel?.text = cont.label
        cell!.detailTextLabel?.text = cont.detail
        return cell!
    }
}

