//
//  MenuViewController.swift
//  SCVZ Canteen
//
//  Created by Nikola Majcen on 27/06/16.
//  Copyright © 2016 Nikola Majcen. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var menuTable: UITableView!
    
    var menu: Menu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menuTable.delegate = self
        self.menuTable.dataSource = self
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MealTableViewCell", forIndexPath: indexPath) as! MealTableViewCell
        
        let meal = Meal()
        meal.icon = "icon"
        meal.name = "Meal X"
        meal.items = ["Banana", "Apple", "Milk"]
        
        cell.configureCell(meal)
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Nothing to do.
    }
}
