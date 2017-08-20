//
//  DesignViewController.swift
//  GridWallPaper
//
//  Created by Zachary on 7/30/17.
//  Copyright © 2017 zacharysp. All rights reserved.
//

import UIKit

class DesignViewController: UIViewController {
    
    var iconsCollectionView: UICollectionView!
    var iconsRowNumber = 6
    
    fileprivate let cellIdentifier = "iconCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }

    
    private func setUpCollectionView(){
        
        let iconSize = screenSize.width
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 38, left: 35, bottom: 0, right: 35)
        layout.itemSize = CGSize(width: 60, height: 60)
        layout.minimumLineSpacing = 40
        layout.minimumInteritemSpacing = 17 
        
        
        iconsCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)

        iconsCollectionView.dataSource = self
        iconsCollectionView.delegate = self
        iconsCollectionView.register(designCell.self, forCellWithReuseIdentifier: cellIdentifier)
        iconsCollectionView.backgroundColor = UIColor.white
        view.addSubview(iconsCollectionView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension DesignViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconsRowNumber * 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! designCell
        
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

class designCell: UICollectionViewCell {
    var icon: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        icon = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        icon.contentMode = UIViewContentMode.scaleAspectFit
        contentView.addSubview(icon)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
