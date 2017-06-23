//
//  SPImageSliderView.swift
//  CollectionViewControllerDemo
//
//  Created by Aravind B on 04/05/17.
//  Copyright © 2017 Aravind B. All rights reserved.
//

import UIKit
//import Kingfisher

@objc protocol ABImageSliderViewDelegate:class {
    @objc optional func clickedImage(index:Int, image:ABImageObject?)
}

class ABImageSliderView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var imageSliderCollectionView: UICollectionView!
    static let defaultCollectionViewCellDimension = 50
    var spaceBetweenCells = 15
    var imageArray:[ABImageObject]!
    var cellSize:Int = 0
    var delegate:ABImageSliderViewDelegate!
    let imageInUploadArray = NSMutableArray()
    var numberOfImages:Int = 0
    
    override init(frame:CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func refreshUI() {
        
        imageInUploadArray.removeAllObjects()
        self.imageSliderCollectionView.reloadData()
    }
    
    func updateImageSlider(dataArray:[ABImageObject]){
        imageArray = dataArray
        refreshUI()
        self.imageSliderCollectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let sliderNib = UINib(nibName: "ABImageSliderCollectionViewCell", bundle: nil)
        self.imageSliderCollectionView.register(sliderNib, forCellWithReuseIdentifier: "CollectionCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        if imageArray != nil {
            return numberOfImages == 0 ? imageArray.count:numberOfImages //imageArray.count+1
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell:ABImageSliderCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! ABImageSliderCollectionViewCell
        cell.profileImageView.contentMode = .scaleAspectFill
        cell.profileImageView.backgroundColor = UIColor.blue
        let imageIndex = indexPath.row - imageArray.count
        
        if imageArray.count > indexPath.row && imageArray.count > 0 {
            let imageObject = imageArray[indexPath.row]
            let imageUrl = imageObject.imageUrl
            
            if imageUrl != nil {
//                cell.profileImageView.showImage(imageUrl: imageUrl, placeholderImage: imageObject.placeHolderImage)
            }else {
                let fullImageurl = imageObject.imageUrl
//                cell.profileImageView.showImage(imageUrl: fullImageurl, placeholderImage: imageObject.placeHolderImage)
            }
            
        }else if (imageInUploadArray.count > 0 && imageIndex < imageInUploadArray.count) {
            cell.profileImageView.image = imageInUploadArray[imageIndex] as? UIImage
        }else{
            cell.profileImageView.contentMode = .center
            cell.profileImageView.image = UIImage(named: "SmallCamera")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        delegate.clickedImage!(index: indexPath.row, image: imageArray[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        if imageArray == nil {
        }
        
        if cellSize == 0 {
            
            let cellSpec = ABImageSliderView.defaultCollectionViewCellDimension
            cellSize = cellSpec
            return CGSize(width: cellSpec, height: cellSpec)
        }
        
        return CGSize(width:cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(spaceBetweenCells)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return CGFloat(spaceBetweenCells)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if imageArray != nil {
            
            let totalCellWidth = cellSize * imageArray.count
            let totalSpacingWidth = spaceBetweenCells * (imageArray.count-1)
            let leftInset = (UIScreen.main.bounds.size.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
            let rightInset = leftInset
            return UIEdgeInsetsMake(0, leftInset, 0, rightInset)
        }
        return UIEdgeInsets.zero
    }
    
}

extension UIImageView {
    
//    func showImage(imageUrl:URL?, placeholderImage:UIImage?) {
//        
//        if imageUrl == nil {
//            self.image = placeholderImage
//            return
//        }
//        
//        let resource:ImageResource = ImageResource(downloadURL: imageUrl!, cacheKey: imageUrl!.lastPathComponent)
//        
//        self.kf.setImage(with: resource, placeholder: placeholderImage, options: nil, progressBlock: { (receivedBytes, totalBytes) in
//            
//        }) { (image, error, cacheType, url) in
//            
//        }
//        
//    }
}

