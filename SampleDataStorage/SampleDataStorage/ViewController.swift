//
//  ViewController.swift
//  SampleDataStorage
//
//  Created by 神馬隆博 on 2017/07/21.
//  Copyright © 2017年 TakahiroJimba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //NSUserDefaultsの生成
        let userDefaults = UserDefaults.standard
        
        //textというキーを指定して保存していた値を取り出す
        if let value = userDefaults.string(forKey: "text") {
        
            textField.text = value
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapActionButton(_ sender: Any) {
    
        //UserDefaultsの生成
        let userDefaults = UserDefaults.standard
        
        //textというキーで値を保存する
        userDefaults.set(textField.text, forKey: "text")
        
        //UserDefaultsへの値の保存を明示的に実施
        userDefaults.synchronize()
    }

}

