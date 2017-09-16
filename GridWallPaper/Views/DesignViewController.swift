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
    var manageStackView: UIStackView!
    
    var wallPaperData: WallPaperData!
//    var iconsRowNumber = 5
    
//    fileprivate let cellIdentifier = "designIconCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        wallPaperData = WallPaperData()
        setWallPaperView()
        setStackView()
    }
    
    private func setWallPaperView(){
        wallPaper = WallPaper(frame: CGRect(x: 0, y: 0, width: view.frame.width*0.8, height: view.frame.height*0.8), data: wallPaperData!)
        view.addSubview(wallPaper!)
    }
    
    private func setManageButton(index: Int, isAdd: Bool = true) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: wallPaper.iconWidth, height: wallPaper.iconWidth))
        button.tag = index
        button.backgroundColor = isAdd ? UIColor.blue : UIColor.red
        button.setTitle(isAdd ? "+" : "-", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = wallPaper.iconCornerRadius
        button.layer.masksToBounds = false
        return button
    }
    
    private func setStackView() {
        manageStackView = UIStackView(frame: CGRect(x: wallPaper.frame.width, y: wallPaper.insets.top, width: view.frame.width - wallPaper.frame.width, height: wallPaper.frame.height))
        manageStackView.axis = .vertical
        manageStackView.distribution = .equalSpacing
        manageStackView.alignment = .firstBaseline
        manageStackView.spacing = wallPaper.itemSpace
        view.addSubview(manageStackView)
        
        for index in 0..<wallPaperData!.iconRowNumber {
            let button = setManageButton(index: index)
            manageStackView.addArrangedSubview(button)
        }
        
        for index in 0..<6 - wallPaperData!.iconRowNumber {
            let button = setManageButton(index: index, isAdd: false)
            manageStackView.addArrangedSubview(button)
        }
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

