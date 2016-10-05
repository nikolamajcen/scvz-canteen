//
//  MenuViewController.swift
//  SCVZ Canteen
//
//  Created by Nikola Majcen on 27/06/16.
//  Copyright © 2016 Nikola Majcen. All rights reserved.
//

import UIKit
import StatefulViewController
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


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
    var selectedMeals: [Meal] = []
    var selectedMenu: Menu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTable.delegate = self
        menuTable.dataSource = self
        
        initializeUI()
        initializeControls()
        initializeStateViews()
        
        downloadMenus()
    }
    
    @IBAction func showPreviousDayMenu(_ sender: UIButton) {
        if selectedMenu!.id > 0 {
            selectedMenu = menus[(selectedMenu?.id)! - 1]
            updateHeaderNavigation()
            updateTableContent()
        }
    }
    
    @IBAction func showNextDayMenu(_ sender: UIButton) {
        if selectedMenu!.id < menus.count {
            selectedMenu = menus[(selectedMenu?.id)! + 1]
            updateHeaderNavigation()
            updateTableContent()
        }
    }
    
    @IBAction func showLunchMenu(_ sender: UIButton) {
        changeButtonFocus(sender)
        changeSelectedMeals(sender)
    }
    
    @IBAction func showDinnerMenu(_ sender: UIButton) {
        changeButtonFocus(sender)
        changeSelectedMeals(sender)
    }
    
    func downloadMenus() {
        startLoading()
        self.canteenStore.fetchMenus { (result, error) in
            if result != nil {
                self.menus = result!
                self.selectedMenu = result?.first
                self.dateLabel.text = self.selectedMenu!.date
                self.selectedMeals = self.selectedMenu!.lunch!
                self.menuTable.reloadData()
                self.updateHeaderNavigation()
                self.endLoading()
            } else {
                self.endLoading(error: error)
            }
        }
    }
    
    fileprivate func initializeUI() {
        changeButtonImageTintColor(previousDayButton, color: UIColor.flatCoffeeColorDark())
        changeButtonImageTintColor(nextDayButton, color: UIColor.flatCoffeeColorDark())
    }
    
    fileprivate func initializeControls() {
        changeButtonFocus(lunchButton)
        changeSelectedMeals(lunchButton)
        
        dateLabel.text = ""
        
        previousDayButton.isHidden = true
        nextDayButton.isHidden = true        
    }
    
    fileprivate func changeButtonImageTintColor(_ button: UIButton, color: UIColor) {
        button.setImage(ImageHelper.imageWithoutTintColor((button.imageView?.image)!),
                        for: UIControlState())
        button.tintColor = color
    }
    
    fileprivate func changeButtonFocus(_ button: UIButton) {
        if button.backgroundColor == UIColor.flatCoffee() {
            return
        }
        
        lunchButton.backgroundColor = UIColor.flatCoffeeColorDark()
        dinnerButton.backgroundColor = UIColor.flatCoffeeColorDark()
        button.backgroundColor = UIColor.flatCoffee()
    }
    
    fileprivate func changeSelectedMeals(_ button: UIButton) {
        switch button {
        case lunchButton:
            menuImage.image = UIImage(named: "Lunch")
            if selectedMenu?.lunch! != nil {
                selectedMeals = selectedMenu!.lunch!
            }
            break
        case dinnerButton:
            menuImage.image = UIImage(named: "Dinner")
            if selectedMenu?.dinner! != nil {
                selectedMeals = selectedMenu!.dinner!
            }
            break
        default:
            break
        }
        
        if selectedMeals.count > 0 {
            menuTable.reloadData()
            menuTable.setContentOffset(CGPoint.zero, animated: true)
        }
    }
    
    fileprivate func updateHeaderNavigation() {
        dateLabel.text = selectedMenu?.date
        if menus.count <= 1 {
            previousDayButton.isHidden = true
            nextDayButton.isHidden = true
            return
        }
        
        if menus.first?.id == selectedMenu?.id {
            previousDayButton.isHidden = true
            nextDayButton.isHidden = false
        } else {
            previousDayButton.isHidden = false
            nextDayButton.isHidden = selectedMenu?.id == (menus.count - 1)
        }
    }
    
    fileprivate func updateTableContent() {
        if lunchButton.backgroundColor == UIColor.flatCoffee() {
            selectedMeals = selectedMenu!.lunch!
        } else {
            selectedMeals = selectedMenu!.dinner!
        }
        menuTable.reloadData()
        menuTable.setContentOffset(CGPoint.zero, animated: true)
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell",
                                                               for: indexPath) as! MenuTableViewCell
        cell.meal = selectedMeals[(indexPath as NSIndexPath).row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedMeals.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Nothing to do.
    }
}

extension MenuViewController: StatefulViewController {
    
    fileprivate func initializeStateViews() {
        errorView = ErrorView(owner: self, action: #selector(MenuViewController.downloadMenus))
        emptyView = EmptyView(owner: self, action: #selector(MenuViewController.downloadMenus))
        loadingView = LoadingView()
    }
    
    func hasContent() -> Bool {
        return selectedMeals.count > 0
    }
}
