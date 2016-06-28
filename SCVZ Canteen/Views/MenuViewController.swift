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
    
    @IBOutlet weak var previousDayButton: UIButton!
    @IBOutlet weak var nextDayButton: UIButton!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var lunchButton: UIButton!
    @IBOutlet weak var dinnerButton: UIButton!
    
    @IBOutlet weak var menuTable: UITableView!
    
    var menu = Menu()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menuTable.delegate = self
        self.menuTable.dataSource = self
        
        self.initializeUI()
        self.initializeControls()
        
        // Example data
        self.dateLabel.text = "28.06.2016."
        
        self.menu.lunch = []
        self.createExampleMenu()
        self.menuTable.reloadData()
    }
    
    @IBAction func showLunchMenu(sender: UIButton) {
        changeMenuImage(sender)
        changeButtonFocus(sender)
    }
    
    @IBAction func showDinnerMenu(sender: UIButton) {
        changeMenuImage(sender)
        changeButtonFocus(sender)
    }
    
    private func initializeUI() {
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController!.navigationBar.translucent = false
        
        self.navigationController?.navigationBar.barTintColor = UIColor.flatSandColorDark()
        self.navigationController?.navigationBar.tintColor = UIColor.flatCoffeeColorDark()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.flatCoffeeColorDark()]
        
        changeButtonImageTintColor(previousDayButton, color: UIColor.flatCoffeeColorDark())
        changeButtonImageTintColor(nextDayButton, color: UIColor.flatCoffeeColorDark())
        
        self.dateLabel.textColor = UIColor.flatCoffeeColorDark()
        self.headerView.backgroundColor = UIColor.flatSandColorDark()
        self.menuTable.backgroundColor = UIColor.flatCoffeeColor()
    }
    
    private func initializeControls() {
        changeMenuImage(lunchButton)
        changeButtonFocus(lunchButton)
    }
    
    private func changeButtonImageTintColor(button: UIButton, color: UIColor) {
        let originalImage = button.imageView?.image
        let tintedImage = originalImage!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        button.setImage(tintedImage, forState: .Normal)
        button.tintColor = color
    }
    
    private func changeMenuImage(button: UIButton) {
        switch button {
        case lunchButton:
            self.menuImage.image = UIImage(named: "Lunch")
            break
        case dinnerButton:
            self.menuImage.image = UIImage(named: "Dinner")
            break
        default:
            break
        }
    }
    
    private func changeButtonFocus(button: UIButton) {
        if button.backgroundColor == UIColor.flatCoffeeColor() {
            return
        }
        
        self.lunchButton.backgroundColor = UIColor.flatCoffeeColorDark()
        self.dinnerButton.backgroundColor = UIColor.flatCoffeeColorDark()
        button.backgroundColor = UIColor.flatCoffeeColor()
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
