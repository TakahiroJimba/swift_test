//
//  ViewController.swift
//  MyApp
//
//  Created by 神馬隆博 on 2017/07/17.
//  Copyright © 2017年 神馬隆博. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //引き算の計算結果をvalue変数に設定
        let value1 :Int = 10 - 1
        
        
        //label.textに文字列を設定して、ラベルの文字を変更
        label.text = "10 - 1 = \(value1)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

