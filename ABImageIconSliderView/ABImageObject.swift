//
//  ABImageObject.swift
//  ImageIconSlider
//
//  Created by Aravind B on 29/05/17.
//  Copyright © 2017 Aravind B. All rights reserved.
//

import UIKit

class ABImageObject: NSObject {
    
    var placeHolderImage:UIImage?
    var imageUrl:URL?
    var image:UIImage?
    var imageId:Int = -1
    
    init(placeHolderImage:UIImage?, imageUrl:URL?, image:UIImage?, imageId:Int) {
        if placeHolderImage != nil {
            self.placeHolderImage = placeHolderImage!
        }
        
        if imageUrl != nil {
            self.imageUrl = imageUrl!
        }
        
        if image != nil {
            self.image = image!
        }
        
        if imageId >= 0 {
            self.imageId = imageId
        }
    }

}
