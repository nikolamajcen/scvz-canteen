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
            ["Minimal Universal Theme",
                "Designed by Freepik and distributed by Flaticon",
                "http://www.flaticon.com/packs/minimal-universal-theme"],
            ["Multimedia Collection",
                "Designed by Gregor Cesnar and distributed by Flaticon",
                "http://www.flaticon.com/packs/multimedia-collection"],
            ["Ventures",
                "Designed by Freepeik and distributed by Flaticon",
                "http://www.flaticon.com/packs/ventures"]
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creditsTable.delegate = self
        creditsTable.dataSource = self
    }
}

extension CreditsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CreditsTableViewCell")!
        let sectionTitle = Array(credits.keys).sorted()[(indexPath as NSIndexPath).section]
        let creditsValues = credits[sectionTitle]![(indexPath as NSIndexPath).row]
                
        cell.textLabel?.text = creditsValues[0]
        cell.detailTextLabel?.text = creditsValues[1]
        cell.accessibilityHint = creditsValues[2]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionNames = Array(credits.keys).sorted()
        return sectionNames[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return credits.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionName = Array(credits.keys).sorted()[section]
        return (credits[sectionName]?.count)!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        let url = cell?.accessibilityHint
        UIApplication.shared.openURL(URL(string: url!)!)
    }
}
