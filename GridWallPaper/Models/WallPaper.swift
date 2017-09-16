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
    fileprivate var bottomView: UIStackView!
    
    fileprivate let cellIdentifier = "wallPaperIconCell"
    
    // public var
    var data: WallPaperData!
    var iconWidth: CGFloat = 60
    var iconCornerRadius: CGFloat = 14
    var itemSpace: CGFloat = 17
    var insets: UIEdgeInsets = UIEdgeInsets()
    
    init(frame: CGRect, data: WallPaperData) {
        super.init(frame:frame)
        
        /*
         Item size rate compare to screen size
         icon width == icon height == item space == screen width * 0.14493
         icon corner radious = screen width * 0.03382
         item space == screen width * 0.09662
         line space == screen height * 0.0231
         
         collection view insets
         top = screen height * 0.05163
         left == right = screen width * 0.08454
         bottom = 0
        */
        
        
        iconWidth = frame.width*0.14493
        iconCornerRadius = frame.width*0.03382
        insets = UIEdgeInsets(top: frame.height*0.05163,
                                  left: frame.width*0.08454,
                                  bottom: 0,
                                  right: frame.width*0.08454)
        itemSpace = frame.height*0.0231
        
        print(iconWidth, insets, itemSpace, frame.width*0.09662)
        
        // set collection view
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = insets
        layout.itemSize = CGSize(width: iconWidth, height: iconWidth+15)
        layout.minimumLineSpacing = 25
        layout.minimumInteritemSpacing = itemSpace

        iconsCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height - 98), collectionViewLayout: layout)
        
        iconsCollectionView.dataSource = self
        iconsCollectionView.delegate = self
        iconsCollectionView.register(iconCell.self, forCellWithReuseIdentifier: cellIdentifier)
        iconsCollectionView.backgroundColor = UIColor.yellow
        self.addSubview(iconsCollectionView)
        
        
        // set bottom stack view
        bottomView = UIStackView(frame: CGRect(x: 0, y: iconsCollectionView.frame.height, width: frame.width, height: 98))
        bottomView.axis = .horizontal
        bottomView.distribution = .equalSpacing
        bottomView.alignment = .center
        bottomView.spacing = frame.width*0.09662
        
        let bg = UIView(frame: bottomView.bounds)
        bg.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        bg.backgroundColor = UIColor.red
        
        bottomView.addSubview(bg)
        self.addSubview(bottomView)
        
        for name in ExampleIcons.bottomIcons {
            
        }
        
        // set data
        self.data = data
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension WallPaper: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.iconRowNumber * 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! iconCell
        
        cell.setUI(iconSize: iconWidth, radius: iconCornerRadius)
        cell.contentView.backgroundColor = UIColor.gray
        cell.layer.masksToBounds = true
        
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = true
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        if indexPath.row < ExampleIcons.nameArr.count {
            cell.icon.image = UIImage(named: ExampleIcons.nameArr[indexPath.row])
            cell.nameLabel.text = ExampleIcons.nameArr[indexPath.row]
        }
        
        print(cell.nameLabel.frame.height)
        
        
        
        return cell
    }
}


class iconCell: UICollectionViewCell {
    var icon: UIImageView!
    var nameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        icon = UIImageView(frame:.zero)
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = UIViewContentMode.scaleAspectFit
        contentView.addSubview(icon)
        nameLabel = UILabel(frame: .zero)
        nameLabel.textAlignment = .center
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont.systemFont(ofSize: 12)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
    }
    
    func setUI(iconSize: CGFloat, radius: CGFloat){
        // set icon constraint
        icon.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        icon.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        icon.widthAnchor.constraint(equalToConstant: iconSize).isActive = true
        icon.heightAnchor.constraint(equalToConstant: iconSize).isActive = true
        // round corner
        icon.layer.cornerRadius = radius
        icon.layer.masksToBounds = true
        
        // set name label constraint
        nameLabel.centerXAnchor.constraint(equalTo: icon.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 2).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("init(coder:) has not been implemented")
    }
}

class WallPaperData: NSObject {
    var iconRowNumber = 4
    var imageRowNumber = 2
    var imageData: Data?
    var imageName: String?
}
