//
//  LoadingView.swift
//  SCVZ Canteen
//
//  Created by Nikola Majcen on 01/07/16.
//  Copyright © 2016 Nikola Majcen. All rights reserved.
//

import UIKit

class LoadingView: StateView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(frame: CGRectZero)
        initializeNib(self, name: "LoadingView")
        initializeView(self, view: contentView)
        loadingIndicator.startAnimating()
    }
}
