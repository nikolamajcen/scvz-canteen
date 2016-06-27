//
//  MealTableViewCell.swift
//  SCVZ Canteen
//
//  Created by Nikola Majcen on 27/06/16.
//  Copyright © 2016 Nikola Majcen. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealTitle: UILabel!
    @IBOutlet weak var mealDescription: UITextView!
    
    override func layoutSubviews() {
        self.initializeUI()
    }
    
    private func initializeUI() {
        self.cardView.layer.cornerRadius = 8
        self.cardView.layer.borderWidth = 4
        self.cardView.layer.borderColor = UIColor.lightTextColor().CGColor
    }
    
    func configureCell(meal: Meal) {
        self.mealImage.image = UIImage(named: meal.icon!)
        self.mealTitle.text = meal.name
        self.mealDescription.text = meal.items!.joinWithSeparator(", ")
        
        // TODO: Change card color by type
    }
}
