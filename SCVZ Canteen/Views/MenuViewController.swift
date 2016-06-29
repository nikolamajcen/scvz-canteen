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
    
    var canteenStore = CanteenStore()
    var menus = [Menu]()
    
    var selectedMenu: Menu?
    var selectedMeals: [Meal]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menuTable.delegate = self
        self.menuTable.dataSource = self
        
        self.initializeUI()
        self.initializeControls()
        
        self.canteenStore.fetchData { (result, error) in
            if result != nil {
                self.menus = result
                self.selectedMenu = result.first
                self.selectedMeals = self.selectedMenu?.lunch
                self.menuTable.reloadData()
            }
        }
    }
    
    @IBAction func showLunchMenu(sender: UIButton) {
        changeButtonFocus(sender)
        changeSelectedMeals(sender)
    }
    
    @IBAction func showDinnerMenu(sender: UIButton) {
        changeButtonFocus(sender)
        changeSelectedMeals(sender)
    }
    
    private func initializeUI() {
        navigationController!.navigationBar.shadowImage = UIImage()
        navigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navigationController!.navigationBar.translucent = false
        
        navigationController?.navigationBar.barTintColor = UIColor.flatSandColorDark()
        navigationController?.navigationBar.tintColor = UIColor.flatCoffeeColorDark()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.flatCoffeeColorDark()]
        
        changeButtonImageTintColor(previousDayButton, color: UIColor.flatCoffeeColorDark())
        changeButtonImageTintColor(nextDayButton, color: UIColor.flatCoffeeColorDark())
        
        dateLabel.textColor = UIColor.flatCoffeeColorDark()
        headerView.backgroundColor = UIColor.flatSandColorDark()
        menuTable.backgroundColor = UIColor.flatCoffeeColor()
    }
    
    private func initializeControls() {
        changeButtonFocus(lunchButton)
        changeSelectedMeals(lunchButton)
    }
    
    private func changeButtonImageTintColor(button: UIButton, color: UIColor) {
        let originalImage = button.imageView?.image
        let tintedImage = originalImage!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        button.setImage(tintedImage, forState: .Normal)
        button.tintColor = color
    }
    
    private func changeButtonFocus(button: UIButton) {
        if button.backgroundColor == UIColor.flatCoffeeColor() {
            return
        }
        
        lunchButton.backgroundColor = UIColor.flatCoffeeColorDark()
        dinnerButton.backgroundColor = UIColor.flatCoffeeColorDark()
        button.backgroundColor = UIColor.flatCoffeeColor()
    }
    
    private func changeSelectedMeals(button: UIButton) {
        switch button {
        case lunchButton:
            menuImage.image = UIImage(named: "Lunch")
            selectedMeals = selectedMenu?.lunch
            break
        case dinnerButton:
            menuImage.image = UIImage(named: "Dinner")
            selectedMeals = selectedMenu?.dinner
            break
        default:
            break
        }
        
        if selectedMeals?.count > 0 {
            menuTable.reloadData()
        }
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuTableViewCell",
                                                               forIndexPath: indexPath) as! MenuTableViewCell
        cell.configureCell(selectedMeals![indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (selectedMeals?.count)!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Nothing to do.
    }
}
