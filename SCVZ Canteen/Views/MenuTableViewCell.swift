//
//  MenuTableViewCell.swift
//  SCVZ Canteen
//
//  Created by Nikola Majcen on 27/06/16.
//  Copyright © 2016 Nikola Majcen. All rights reserved.
//

import UIKit
import ChameleonFramework

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealTitle: UILabel!
    @IBOutlet weak var mealDescription: UITextView!
    
    func configureCell(meal: Meal) {
        self.mealImage.image = UIImage(named: meal.icon!)
        self.mealTitle.text = meal.name
        self.mealDescription.text = meal.items!.joinWithSeparator(", ")
        
        self.backgroundColor = UIColor(averageColorFromImage: self.mealImage.image)
        
        // TODO: Need to remove (images won't have white space)
        formatMealImage(self.mealImage)
    }
    
    private func formatMealImage(image: UIImageView) {
        image.layer.cornerRadius = image.bounds.height / 2
    }
}
