//
//  EmptyView.swift
//  SCVZ Canteen
//
//  Created by Nikola Majcen on 01/07/16.
//  Copyright © 2016 Nikola Majcen. All rights reserved.
//

import UIKit

class EmptyView: StateView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(frame: CGRectZero)
        initializeNib(self, name: "EmptyView")
        initializeView(self, view: contentView)        
    }
}
