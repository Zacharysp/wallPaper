//
//  LibraryViewController.swift
//  GridWallPaper
//
//  Created by Zachary on 8/10/17.
//  Copyright © 2017 zacharysp. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {

    
    var libraryCollectionView: UICollectionView!
    
    fileprivate let cellIdentifier = "libraryCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        
        print(UIScreen.main.bounds)
    }
    
    private func setUpCollectionView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 40, right: 20)
        let itemWidth: CGFloat = (self.view.frame.width - 80)*0.5
        let itemHeight: CGFloat = itemWidth/414.0*736.0
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        libraryCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        libraryCollectionView.dataSource = self
        libraryCollectionView.delegate = self
        libraryCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        libraryCollectionView.backgroundColor = UIColor.white
        view.addSubview(libraryCollectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension LibraryViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1
        cell.contentView.dropShadow()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "libraryToDesign", sender: nil)
    }
}
