//
//  SettingsViewController.swift
//  SCVZ Canteen
//
//  Created by Nikola Majcen on 29/06/16.
//  Copyright © 2016 Nikola Majcen. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingsTable: UITableView!

    let settings = [
        "General": ["Credits", "About"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsTable.delegate = self
        settingsTable.dataSource = self
        
        initializeUI()
    }
    
    private func initializeUI() {
        settingsTable.tableFooterView = UIView()
        settingsTable.backgroundColor = UIColor.flatSandColorDark()
        settingsTable.separatorColor = UIColor.flatCoffeeColor()
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SettingsTableViewCell")!
        let sectionTitle = Array(settings.keys).sort()[indexPath.section]
        let settingTitle = settings[sectionTitle]![indexPath.row]
        
        cell.backgroundColor = UIColor.flatSandColorDark()
        cell.textLabel?.textColor = UIColor.flatCoffeeColorDark()
        cell.textLabel?.text = settingTitle
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionNames = Array(settings.keys).sort()
        return sectionNames[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return settings.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionName = Array(settings.keys).sort()[section]
        return (settings[sectionName]?.count)!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        let segueName = cell?.textLabel?.text
        performSegueWithIdentifier(segueName!, sender: self)
    }
}