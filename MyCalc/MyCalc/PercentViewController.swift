//
//  PercentViewController.swift
//  MyCalc
//
//  Created by 神馬隆博 on 2017/07/19.
//  Copyright © 2017年 TakahiroJimba. All rights reserved.
//

import UIKit

class PercentViewController: UIViewController {

    var price: Int = 0
    
    //割引パーセンテージ入力フィールド
    @IBOutlet weak var percentField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func tap9Button(_ sender: Any) {
        
        let value = "\(percentField.text!)" + "9"   //数字の9を末尾に追加する
        if let price = Int(value){                  //文字列型の数字を数値型に変換する
            
            percentField.text = "\(price)"          //価格フィールドに数値を反映する
            
        }
    }
    
    @IBAction func tap8Button(_ sender: Any) {
        
        let value = "\(percentField.text!)" + "8"   //数字の8を末尾に追加する
        if let price = Int(value){                  //文字列型の数字を数値型に変換する
            
            percentField.text = "\(price)"          //価格フィールドに数値を反映する
            
        }
    }
    
    @IBAction func tap7Button(_ sender: Any) {
        
        let value = "\(percentField.text!)" + "7"   //数字の7を末尾に追加する
        if let price = Int(value){                  //文字列型の数字を数値型に変換する
            
            percentField.text = "\(price)"          //価格フィールドに数値を反映する
            
        }
    }

    @IBAction func tap6Button(_ sender: Any) {
        
        let value = "\(percentField.text!)" + "6"   //数字の6を末尾に追加する
        if let price = Int(value){                  //文字列型の数字を数値型に変換する
            
            percentField.text = "\(price)"          //価格フィールドに数値を反映する
            
        }
    }

    @IBAction func tap5Button(_ sender: Any) {
        
        let value = "\(percentField.text!)" + "5"   //数字の5を末尾に追加する
        if let price = Int(value){                  //文字列型の数字を数値型に変換する
            
            percentField.text = "\(price)"          //価格フィールドに数値を反映する
            
        }
    }
    
    @IBAction func tap4Button(_ sender: Any) {
        
        let value = "\(percentField.text!)" + "4"   //数字の4を末尾に追加する
        if let price = Int(value){                  //文字列型の数字を数値型に変換する
            
            percentField.text = "\(price)"          //価格フィールドに数値を反映する
            
        }
    }
    
    @IBAction func tap3Button(_ sender: Any) {
        
        let value = "\(percentField.text!)" + "3"   //数字の3を末尾に追加する
        if let price = Int(value){                  //文字列型の数字を数値型に変換する
            
            percentField.text = "\(price)"          //価格フィールドに数値を反映する
            
        }
    }
    
    @IBAction func tap2Button(_ sender: Any) {
        
        let value = "\(percentField.text!)" + "2"   //数字の2を末尾に追加する
        if let price = Int(value){                  //文字列型の数字を数値型に変換する
            
            percentField.text = "\(price)"          //価格フィールドに数値を反映する
            
        }
    }
    

    @IBAction func tap1Button(_ sender: Any) {
        
        let value = "\(percentField.text!)" + "1"   //数字の1を末尾に追加する
        if let price = Int(value){                  //文字列型の数字を数値型に変換する
            
            percentField.text = "\(price)"          //価格フィールドに数値を反映する
            
        }
    }
    
    @IBAction func tap0Button(_ sender: Any) {
        
        let value = "\(percentField.text!)" + "0"   //数字の0を末尾に追加する
        if let price = Int(value){                  //文字列型の数字を数値型に変換する
            
            percentField.text = "\(price)"          //価格フィールドに数値を反映する
            
        }
    }
    
    @IBAction func tapClearButton(_ sender: Any) {
        
        percentField.text = "0"                     //数字の0を直接入れてクリアする
    }
    
    //計算するボタンがタップされて、次の画面に移動する際の前処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //次の画面を取り出す
        let viewController = segue.destination as! ResultViewController
        
        //次の画面に現在保持している金額を設定する
        viewController.price = price
        if let percent = Int(percentField.text!){   //文字列を数値に変換する
            //次の画面に現在保持しているパーセンテージを設定する
            viewController.percent = percent
        }
    }
}
