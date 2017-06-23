//
//  ABImageSliderCollectionViewCell.swift
//  CollectionViewControllerDemo
//
//  Created by Aravind B on 04/05/17.
//  Copyright © 2017 Aravind B. All rights reserved.
//

import UIKit
//import UICircularProgressRing

class ABImageSliderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.profileImageView.layer.cornerRadius = self.profileImageView.bounds.size.width/2
        self.profileImageView.clipsToBounds = true
        
    }
    
}
