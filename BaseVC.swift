//
//  BaseVC.swift
//  MatrixDemo
//
//  Created by Karan Mehta on 20/05/18.
//  Copyright © 2018 Karan Mehta. All rights reserved.
//

import UIKit

class CustomNavController:  UINavigationController{}

class BaseVC: UIViewController {

    lazy var navBar: UINavigationBar? = {
        let navigationBarAppearace = self.navigationController?.navigationBar
        navigationBarAppearace?.tintColor = uicolorFromHex(rgbValue: 0xffffff)
        navigationBarAppearace?.barTintColor = uicolorFromHex(rgbValue: 0x034517)
        return navigationBarAppearace
    }()
    
    func leftButton(img: UIImage) {
        let btn = UIBarButtonItem(image: img.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = btn
    }

    var updateNavColor: UInt32 = 0 {
        didSet {
            self.navBar?.barTintColor = uicolorFromHex(rgbValue: updateNavColor)
        }
    }
    
    
    func uicolorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    
    @objc func back() {
        print("left button tapped")
        self.navigationController?.popViewController(animated: true)
    }
    
    lazy var tmpView: UIView = {
        let view = UIView.init()
        
        let screen = UIScreen.main.bounds
        view.frame = CGRect.init(x: screen.width - 50, y: screen.height - 100, width: 30, height: 30.0)
        view.backgroundColor = .blue
        return view
    }()
    override func viewDidLoad() {
        _ = self.navBar
        self.view.addSubview(tmpView)
    }
    

}
