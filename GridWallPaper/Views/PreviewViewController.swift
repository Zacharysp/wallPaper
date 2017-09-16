//
//  PreviewViewController.swift
//  GridWallPaper
//
//  Created by Zachary on 8/19/17.
//  Copyright © 2017 zacharysp. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
    
    var wallPaper: WallPaper!
    var wallPaperData: WallPaperData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wallPaperData = WallPaperData()
        wallPaper = WallPaper(frame: view.frame, data: wallPaperData!)
        view.addSubview(wallPaper!)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
