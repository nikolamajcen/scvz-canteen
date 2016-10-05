//
//  StateView.swift
//  SCVZ Canteen
//
//  Created by Nikola Majcen on 01/07/16.
//  Copyright © 2016 Nikola Majcen. All rights reserved.
//

import UIKit

class StateView: UIView {

    func initializeNib(_ owner: UIView, name: String) {
        Bundle.main.loadNibNamed(name, owner: owner, options: nil)
    }
    
    func initializeView(_ container: UIView, view: UIView) {
        view.frame = container.bounds
        container.addSubview(view)
    }
}
