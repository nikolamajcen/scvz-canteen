//
//  ErrorView.swift
//  SCVZ Canteen
//
//  Created by Nikola Majcen on 01/07/16.
//  Copyright © 2016 Nikola Majcen. All rights reserved.
//

import UIKit
import ChameleonFramework

class ErrorView: StateView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(owner: UIViewController, action: Selector) {
        super.init(frame: CGRectZero)
        initializeNib(self, name: "ErrorView")
        initializeView(self, view: contentView)
        
        imageView.image = ImageHelper.imageWithoutTintColor(UIImage(named: "Error")!)
        imageView.tintColor = UIColor.flatCoffeeColorDark()
        
        refreshButton.addTarget(owner, action: action, forControlEvents: .TouchUpInside)
    }
}
