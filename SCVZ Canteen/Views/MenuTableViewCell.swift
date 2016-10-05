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
    
    var meal: Meal? {
        didSet {
            mealTitle.text = meal!.title
            mealDescription.text = meal!.items!.joined(separator: ", ")
            mealImage.image = UIImage(named: meal!.icon!.rawValue)
            backgroundColor = UIColor(averageColorFrom: mealImage.image)
        }
    }
}
