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
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell")!
        let sectionTitle = Array(settings.keys).sorted()[(indexPath as NSIndexPath).section]
        let settingTitle = settings[sectionTitle]![(indexPath as NSIndexPath).row]
        
        cell.textLabel?.text = settingTitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionNames = Array(settings.keys).sorted()
        return sectionNames[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionName = Array(settings.keys).sorted()[section]
        return (settings[sectionName]?.count)!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        let segueName = cell?.textLabel?.text
        performSegue(withIdentifier: segueName!, sender: self)
    }
}
