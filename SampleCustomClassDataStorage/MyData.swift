//
//  MyData.swift
//  SampleCustomClassDataStorage
//
//  Created by 神馬隆博 on 2017/07/21.
//  Copyright © 2017年 TakahiroJimba. All rights reserved.
//

import Foundation

class MyData :NSObject, NSCoding {
    
    var valueString :String?
    
    override init() {
    
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(valueString, forKey: "valueString")
    }
    
    required init?(coder aDecoder: NSCoder) {
        valueString = aDecoder.decodeObject(forKey: "valueString") as? String
    }
    
}
