//
//  ViewController.swift
//  MyCalc
//
//  Created by 神馬隆博 on 2017/07/18.
//  Copyright © 2017年 TakahiroJimba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var priceField: UITextField!
    
    @IBAction func restart(segue :UIStoryboardSegue){
        priceField.text = "0"   //金額フィールドを0でクリアする
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("test load")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func tap0Button(_ sender: Any) {
        
        let value = "\(priceField.text!)" + "0"     //数字の0を末尾に追加する
        if let price = Int(value){                  //文字列型の数字を数値型に変換する
            
            priceField.text = "\(price)"            //価格フィールドに数値を反映する
            
        }
    }
    
    @IBAction func tap00Button(_ sender: Any) {
        
        let value = "\(priceField.text!)" + "00"    //数字の0を末尾に追加する
        if let price = Int(value){                  //文字列型の数字を数値型に変換する
            
            priceField.text = "\(price)"            //価格フィールドに数値を反映する
            
        }
    }
    
    @IBAction func tapClearButton(_ sender: Any) {
        
        //print("testCC")
        priceField.text = "0"                       //数字の0を直接入れてクリアする
    }

    @IBAction func tap1Button(_ sender: Any) {
        
        let value = "\(priceField.text!)" + "1"     //数字の1を末尾に追加する
        //print("value = " + value)
        if let price = Int(value){                  //文字列型の数字を数値型に変換する
            
            //print("test1")
            priceField.text = "\(price)"            //価格フィールドに数値を反映する
        
        }
    }

    @IBAction func tap2Button(_ sender: Any) {
    
        let value = "\(priceField.text!)" + "2"     //数字の2を末尾に追加する
        if let price = Int(value){                  //文字列型の数字を数値型に変換する
            
            priceField.text = "\(price)"            //価格フィールドに数値を反映する
            
        }
    }
    
    @IBAction func tap3Button(_ sender: Any) {
    
        let value = "\(priceField.text!)" + "3"     //数字の3を末尾に追加する
        if let price = Int(value){                  //文字列型の数字を数値型に変換する
            
            priceField.text = "\(price)"            //価格フィールドに数値を反映する
            
        }
    }
    
    @IBAction func tap4Button(_ sender: Any) {
    
        let value = "\(priceField.text!)" + "4"     //数字の4を末尾に追加する
        if let price = Int(value){                  //文字列型の数字を数値型に変換する
            
            priceField.text = "\(price)"            //価格フィールドに数値を反映する
            
        }
    
    }
    
    @IBAction func tap5Button(_ sender: Any) {

        let value = "\(priceField.text!)" + "5"     //数字の5を末尾に追加する
        if let price = Int(value){                  //文字列型の数字を数値型に変換する
            
            priceField.text = "\(price)"            //価格フィールドに数値を反映する
            
        }
    }
    
    @IBAction func tap6Button(_ sender: Any) {
    
        let value = "\(priceField.text!)" + "6"     //数字の6を末尾に追加する
        if let price = Int(value){                  //文字列型の数字を数値型に変換する
            
            priceField.text = "\(price)"            //価格フィールドに数値を反映する
            
        }
    }
    
    @IBAction func tap7Button(_ sender: Any) {
        
        let value = "\(priceField.text!)" + "7"     //数字の7を末尾に追加する
        if let price = Int(value){                  //文字列型の数字を数値型に変換する
            
            priceField.text = "\(price)"            //価格フィールドに数値を反映する
            
        }
    }
    
    @IBAction func tap8Button(_ sender: Any) {
    
        let value = "\(priceField.text!)" + "8"     //数字の8を末尾に追加する
        if let price = Int(value){                  //文字列型の数字を数値型に変換する
            
            priceField.text = "\(price)"            //価格フィールドに数値を反映する
            
        }
    }
    
    @IBAction func tap9Button(_ sender: Any) {
        
        let value = "\(priceField.text!)" + "9"     //数字の9を末尾に追加する
        if let price = Int(value){                  //文字列型の数字を数値型に変換する
            
            priceField.text = "\(price)"            //価格フィールドに数値を反映する
            
        }
    }
    
    //画面遷移時の処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //次の画面を取り出す
        let viewController = segue.destination as! PercentViewController
        
        //金銭フィールドの文字列を数値に変換する
        if let price = Int(priceField.text!){
            //数値に変換した金額を次の画面に設定する
            viewController.price = price
        }
    }
}

