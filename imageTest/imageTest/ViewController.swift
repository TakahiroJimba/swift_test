//
//  ViewController.swift
//  imageTest
//
//  Created by 神馬隆博 on 2017/07/22.
//  Copyright © 2017年 TakahiroJimba. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {    //追加してね

    @IBOutlet weak var imageView: UIImageView!  //写真表示用
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.contentMode = .scaleAspectFit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cameraRollButton(_ sender: Any) {
        
        pickImageFromLibrary()  //ライブラリから写真を選択する
    }
    
    /**
     ライブラリから写真を選択する
     */
    func pickImageFromLibrary() {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {    //追記
            
            //写真ライブラリ(カメラロール)表示用のViewControllerを宣言しているという理解
            let controller = UIImagePickerController()
            
            //おまじないという認識で今は良いと思う
            controller.delegate = self
            
            //新しく宣言したViewControllerでカメラとカメラロールのどちらを表示するかを指定
            //以下はカメラロールの例
            //.Cameraを指定した場合はカメラを呼び出し(シミュレーター不可)
            controller.sourceType = UIImagePickerControllerSourceType.photoLibrary
            
            //新たに追加したカメラロール表示ViewControllerをpresentViewControllerにする
            self.present(controller, animated: true, completion: nil)
        }
    }
    
//    /**
//     写真を選択した時に呼ばれる (swift2.0対応)
//     
//     :param: picker:おまじないという認識で今は良いと思う
//     :param: didFinishPickingMediaWithInfo:おまじないという認識で今は良いと思う
//     */
//    @nonobjc func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo: [String: AnyObject]) {
//        
//        //このif条件はおまじないという認識で今は良いと思う
//        if didFinishPickingMediaWithInfo[UIImagePickerControllerOriginalImage] != nil {
//            
//            //didFinishPickingMediaWithInfo通して渡された情報(選択された画像情報が入っている？)をUIImageにCastする
//            //そしてそれを宣言済みのimageViewへ放り込む
//            print("test222222222222222")
//            imageView.image = didFinishPickingMediaWithInfo[UIImagePickerControllerOriginalImage] as? UIImage
//            print(imageView.image)
//            print("test1111111111111111111111111")
//            
//        }
//        
//        //写真選択後にカメラロール表示ViewControllerを引っ込める動作
//        picker.dismiss(animated: true, completion: nil)
//    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage?
        imageView.image = image
        
        //写真選択後にカメラロール表示ViewControllerを引っ込める動作
        picker.dismiss(animated: true, completion: nil)
    }

}

