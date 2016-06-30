//
//  CreditsViewController.swift
//  SCVZ Canteen
//
//  Created by Nikola Majcen on 30/06/16.
//  Copyright © 2016 Nikola Majcen. All rights reserved.
//

import UIKit
import ChameleonFramework

class CreditsViewController: UIViewController {
    
    @IBOutlet weak var creditsTable: UITableView!
    
    let credits = [
        "Artwork": [
            ["Circle color food",
                "Designed by Freepik and distributed by Flaticon",
                "http://www.flaticon.com/packs/circle-color-food"],
            ["Essential UI",
                "Designed by Freepik and distributed by Flaticon",
                "http://www.flaticon.com/packs/essential-ui"],
            ["Multimedia Collection",
                "Designed by Gregor Cesnar and distributed by Flaticon",
                "http://www.flaticon.com/packs/multimedia-collection"]
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creditsTable.delegate = self
        creditsTable.dataSource = self
        
        initializeUI()
    }
    
    private func initializeUI() {
        creditsTable.tableFooterView = UIView()
    }
}

extension CreditsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CreditsTableViewCell")!
        let sectionTitle = Array(credits.keys).sort()[indexPath.section]
        let creditsValues = credits[sectionTitle]![indexPath.row]
                
        cell.textLabel?.text = creditsValues[0]
        cell.detailTextLabel?.text = creditsValues[1]
        cell.accessibilityHint = creditsValues[2]
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionNames = Array(credits.keys).sort()
        return sectionNames[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return credits.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionName = Array(credits.keys).sort()[section]
        return (credits[sectionName]?.count)!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        let url = cell?.accessibilityHint
        UIApplication.sharedApplication().openURL(NSURL(string: url!)!)
    }
}