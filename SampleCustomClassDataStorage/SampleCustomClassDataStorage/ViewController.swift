//
//  ViewController.swift
//  SampleCustomClassDataStorage
//
//  Created by 神馬隆博 on 2017/07/21.
//  Copyright © 2017年 TakahiroJimba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //画面表示時にデータを格納
        let userDefaults = UserDefaults.standard
        let data = MyData()
        data.valueString = "test"
        
        //シリアライズ処理
        let archiveData = NSKeyedArchiver.archivedData(withRootObject: data)
        userDefaults.set(archiveData, forKey: "data")
        userDefaults.synchronize()
        
        //デシリアライズ処理
        if let storedDate = userDefaults.object(forKey: "data") as? NSData{
            if let unarchivedData = NSKeyedUnarchiver.unarchiveObject(with: storedDate as Data) as? MyData{
                if let valueString = unarchivedData.valueString{
                    print("デシリアライズデータ:" + valueString)
                }
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
