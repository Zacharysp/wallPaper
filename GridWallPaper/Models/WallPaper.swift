//
//  WallPaper.swift
//  GridWallPaper
//
//  Created by Zachary on 8/20/17.
//  Copyright © 2017 zacharysp. All rights reserved.
//

import UIKit

class WallPaper: UIView {
    fileprivate var iconsCollectionView: UICollectionView!
    var iconsRowNumber = 6
    
    fileprivate let cellIdentifier = "wallPaperIconCell"
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        print("top: \(38 / screenSize.height)")
        print("left: \(35 / screenSize.width)")
        print("bottom: \(0 / screenSize.height)")
        print("right: \(35 / screenSize.width)")
        print("icon width: \(60 / screenSize.width)")
        print("item space: \(40 / screenSize.width)")
        print("line space: \(17 / screenSize.height)")
        
        /*
         Item size rate compare to screen size
         icon width == icon height == item space == screen width * 0.14493
         item space == screen width * 0.09662
         line space == screen height * 0.0231
         
         collection view insets
         top = screen height * 0.05163
         left == right = screen width * 0.08454
         bottom = 0
        */
        
        let insets = UIEdgeInsets(top: frame.height*0.05163,
                                  left: frame.width*0.08454,
                                  bottom: 0,
                                  right: frame.width*0.08454)
        let iconWidth = frame.width*0.14493
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = insets
        layout.itemSize = CGSize(width: iconWidth, height: iconWidth)
        layout.minimumLineSpacing = frame.width*0.09662
        layout.minimumInteritemSpacing = frame.height*0.0231

        
        iconsCollectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        
        iconsCollectionView.dataSource = self
        iconsCollectionView.delegate = self
        iconsCollectionView.register(previewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        iconsCollectionView.backgroundColor = UIColor.white
        self.addSubview(iconsCollectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension WallPaper: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconsRowNumber * 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! previewCell
        
        cell.contentView.layer.cornerRadius = 14.0
        cell.contentView.layer.masksToBounds = true
        cell.contentView.backgroundColor = UIColor.white
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        if indexPath.row < ExampleIcons.nameArr.count {
            cell.icon.image = UIImage(named: ExampleIcons.nameArr[indexPath.row])
        }
        return cell
    }
}

class WallPaperData: NSObject {
    var iconRowNumber = 4
    var imageRowNumber = 2
    var imageData: Data?
    var imageName: String?
}
