//
//  customPicker.swift
//  MatrixDemo
//
//  Created by Karan Mehta on 19/05/18.
//  Copyright © 2018 Karan Mehta. All rights reserved.
//

import UIKit
import Foundation

struct test {
    var abc = ["tst","asdfasdfasdfasdfasdf"]
}
struct test2 {
    var abc = ["tst","asdfasdf"]
}
protocol pickerDataSource {
    
    var gerTest:[String] { get }
    
}

enum tmpType {
    case a,b
}
protocol DelegatePickerItem: class{
    func currentIndex(_index:Int,type:tmpType)
}


class picker: UIPickerView,UIPickerViewDataSource,UIPickerViewDelegate {
    
    
   
    var type: tmpType = .a
    
    weak var customDelegate:DelegatePickerItem?
    
    var arrData = [String]()
    
    init(data:[String],type:tmpType) {
        self.init()
        self.arrData = data
        self.type = type
        self.dataSource = self
        self.delegate = self
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.dataSource = self

        self.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.arrData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let _delegate = self.customDelegate {
            _delegate.currentIndex(_index: row, type: self.type)
        }
    }
    
}









