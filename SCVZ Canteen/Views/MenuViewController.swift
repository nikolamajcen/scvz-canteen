//
//  MenuViewController.swift
//  SCVZ Canteen
//
//  Created by Nikola Majcen on 27/06/16.
//  Copyright © 2016 Nikola Majcen. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var menuImage: UIImageView!
    
    @IBOutlet weak var lunchButton: UIButton!
    @IBOutlet weak var dinnerButton: UIButton!
    
    @IBOutlet weak var menuTable: UITableView!
    
    var menu = Menu()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menuTable.delegate = self
        self.menuTable.dataSource = self
                
        self.view.backgroundColor = UIColor.flatSandColorDark()
        self.headerView.backgroundColor = UIColor.flatSandColorDark()
        
        self.menuTable.backgroundColor = UIColor.flatCoffeeColor()
        self.lunchButton.backgroundColor = UIColor.flatCoffeeColor()
        self.dinnerButton.backgroundColor = UIColor.flatCoffeeColorDark()
        
        // Example data
        self.menu.lunch = []
        self.createExampleMenu()
        self.menuTable.reloadData()
    }
    
    private func createExampleMenu() {
        let items = ["Soup", "Spaghetti Bolognese", "Apple", "Orange", "Nectar Juice"]
        let name = "Menu X"
        
        let icons = ["Rice", "Broccoli", "Sausage", "Pepper", "Pizza"]
        
        for icon:String in icons {
            let meal = Meal()
            meal.icon = icon
            meal.name = name
            meal.items = items
            menu.lunch?.append(meal)
        }
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuTableViewCell",
                                                               forIndexPath: indexPath) as! MenuTableViewCell
        cell.configureCell(menu.lunch![indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let lunch = menu.lunch else {
            return 0
        }
        return lunch.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Nothing to do.
    }
}
