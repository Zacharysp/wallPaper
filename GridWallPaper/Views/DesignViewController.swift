//
//  DesignViewController.swift
//  GridWallPaper
//
//  Created by Zachary on 7/30/17.
//  Copyright © 2017 zacharysp. All rights reserved.
//

import UIKit

class DesignViewController: UIViewController {
    
    var wallPaper: WallPaper!
//    var manageStackView: UIStackView!
//    var iconsRowNumber = 5
    
//    fileprivate let cellIdentifier = "designIconCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        wallPaper = WallPaper(frame: self.view.frame)
        view.addSubview(wallPaper)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

