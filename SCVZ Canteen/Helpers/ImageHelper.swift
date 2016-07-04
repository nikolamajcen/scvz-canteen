//
//  ImageHelper.swift
//  SCVZ Canteen
//
//  Created by Nikola Majcen on 04/07/16.
//  Copyright © 2016 Nikola Majcen. All rights reserved.
//

import UIKit

class ImageHelper {
    
    static func imageWithoutTintColor(image: UIImage) -> UIImage {
        return image.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
    }
}
