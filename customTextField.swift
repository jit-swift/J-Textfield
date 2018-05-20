//
//  customTextField.swift
//  MatrixDemo
//
//  Created by Karan Mehta on 19/05/18.
//  Copyright © 2018 Karan Mehta. All rights reserved.
//

import UIKit



class customTextField : UITextField {
    
    
    enum Em_ImgagePosition: Int{
        case left = 1
        case right = 2
        case none = 3
        
    }
    var image: UIImage?
    
    @IBInspectable var cornerRadius: CGFloat = 1.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
            self.layer.masksToBounds = true
        }
    }
    @IBInspectable var borderWidht: CGFloat = 1.0 {
        didSet {
            self.layer.borderWidth = self.borderWidht
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = self.borderColor.cgColor
        }
    }
    @IBInspectable var placeHolderColor: UIColor = UIColor.lightGray {
        didSet{
            guard let txt = self.placeholder else { return }
            self.attributedPlaceholder = NSAttributedString.init(string: txt, attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
        }
    }
    
    @IBInspectable var adapterImage: UIImage = UIImage() {
        didSet{
            
            self.imgView.image = adapterImage
            guard let currentPosition =  Em_ImgagePosition.init(rawValue: imagePosition) else {
                return
            }
            self.addImageToTextfield(currentPosition)
        }
    }
    
    @IBInspectable var imagePosition: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    lazy var imgView: UIImageView = {
        
        var imgview = UIImageView.init()
        imgview.frame = CGRect(x: 0.0, y: 0.0, width: 30, height: 30)
//        if let img = self.image {
//            imgview.image = img
//        }
        imgview.contentMode = .scaleAspectFit
        
        return imgview
    }()
    
    lazy var adapterView: UIView = {
        
        var view = UIView.init()
        view.frame = CGRect(x: 0.0, y: 0.0, width: self.bounds.height, height: self.bounds.height)
        view.backgroundColor = .clear
        
        self.addSubview(self.imgView)
        var center = self.imgView.center
        center = view.center
        self.imgView.center = center
        
        return view
    }()

    
    func addImageToTextfield(_ position: Em_ImgagePosition)  {
        
        if position == .left {
            print("left")
            guard self.imgView.image != nil else { return }
            self.leftView = self.adapterView
            self.leftViewMode = .always
            
        }else if position == .right {
            print("right")
            guard self.image != nil else { return }
            self.rightView = self.adapterView
            self.rightViewMode = .always
        }
    }
    
}
