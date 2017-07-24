//
//  ViewController.swift
//  MytodoList
//
//  Created by 神馬隆博 on 2017/07/22.
//  Copyright © 2017年 TakahiroJimba. All rights reserved.
//

import UIKit

//独自クラスをシリアライズする際には、NSObjectを継承し、
//NSCodingプロトコルに準拠する必要がある
class MyTodo: NSObject, NSCoding{
    
    //Todoのタイトル
    var todoTitle :String?
    
    //Todoが完了したかどうかを表すフラグ
    var todoDone :Bool = false
    
    //コンストラクタ
    override init(){
        
    }
    
    //NSCodingプロトコルに宣言されているデシリアライズ処理。デコード処理とも呼ばれる。
    required init?(coder aDecoder: NSCoder) {
        todoTitle = (aDecoder.decodeObject(forKey: "todoTitle") as? String)!
        todoDone = aDecoder.decodeBool(forKey: "todoDone")
    }
    
    //NSCodingプロトコルに宣言されているシリアライズ処理。エンコード処理とも呼ばれる
    func encode(with aCoder: NSCoder) {
        aCoder.encode(todoTitle, forKey: "todoTitle")
        aCoder.encode(todoDone, forKey: "todoDone")
    }
}

//UITableViewDataSource, UITableViewDelegateのプロトコルを実装する旨の宣言をする
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //TODOを格納する配列
    var todoList = [MyTodo]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //----------------
        // 読み込み処理を追加
        //----------------
        let userDefaults = UserDefaults.standard
        
        if let todoListData = userDefaults.object(forKey: "todoList") as? NSData {
            if let storedTodoList = NSKeyedUnarchiver.unarchiveObject(with: todoListData as Data) as? [MyTodo]{
                todoList.append(contentsOf: storedTodoList)
            }
            
//        if let storedTodoList = userDefaults.array(forKey: "todoList") as? [String]{
//            todoList.append(contentsOf: storedTodoList)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapAddButton(_ sender: Any) {
        //アラートダイアログ作成
        let alertController = UIAlertController(title: "TODO追加", message: "TODOを入力してください", preferredStyle: UIAlertControllerStyle.alert)
        
        //テキストエリアを追加
        alertController.addTextField(configurationHandler: nil)
        
        //OKボタンを追加
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action:UIAlertAction) -> Void in
            //OKボタンが押された時の処理
            if let textField = alertController.textFields?.first{
                //TODOの配列に入力した値を挿入。先頭に挿入する。
                var todo :MyTodo = MyTodo()
                todo.todoTitle = textField.text!
                self.todoList.insert(todo, at: 0)
                
                //テーブルに行が追加されたことをテーブルに通知
                self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableViewRowAnimation.right)
                
                //------------
                // 保存処理を追加
                //------------
                //NSData型にシリアライズする
                let data :NSData = NSKeyedArchiver.archivedData(withRootObject: self.todoList) as NSData
                
                //UserDefaultsに保存する
                let userDefaults = UserDefaults.standard
                userDefaults.set(data, forKey: "todoList")
                userDefaults.synchronize()
            }
        }
        
        //キャンセルボタンを追加
        alertController.addAction(okAction)
        
        //CANCELボタンがタップされた時の処理
        let cancelAction = UIAlertAction(title: "CANCEL", style: UIAlertActionStyle.cancel, handler: nil)
        
        //CANCELボタンを追加
        alertController.addAction(cancelAction)
        
        //アラートダイアログの表示
        present(alertController, animated: true, completion: nil)
    }
    
    //テーブルの行数を返却する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //ToDoの配列の長さを返却する
        return todoList.count
    }

    //テーブルの行ごとのセルを返却する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        //storyboardで指定したtodoCell識別子を使用して再利用可能なセルを取得する
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for : indexPath)

        //行番号に合ったToDoのタイトルを取得
        let todo = todoList[indexPath.row]
        
        //セルのラベルにToDoのタイトルをセット
        cell.textLabel!.text = todo.todoTitle
        
        if todo.todoDone {
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.none
        }
        return cell
    }
    
    //セルをタップした時の処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todoList[indexPath.row]
        
        if todo.todoDone{
            //完了済みの場合は未完に変更
            todo.todoDone = false
        } else {
            //未完の場合は完了済みに変更
            todo.todoDone = true
        }
        
        //セルの状態を変更
        tableView.reloadRows(at: [indexPath], with: .fade)
        
        //データ保存
        //NSData型にシリアライズする
        let data :NSData = NSKeyedArchiver.archivedData(withRootObject: todoList) as NSData
        
        //UserDefaultsに保存
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "todoList")
        userDefaults.synchronize()
    }
    
    //セルが編集可能かどうかの判定処理
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    //セルを削除した時の処理
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        //削除処理かどうか
        if editingStyle == .delete{
            //ToDoリストから削除
            todoList.remove(at: indexPath.row)
            
            //セルを削除
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            //データ保存
            //NSData型にシリアライズする
            let data :NSData = NSKeyedArchiver.archivedData(withRootObject: todoList) as NSData
            
            //UserDefaultsに保存
            let userDefaults = UserDefaults.standard
            userDefaults.set(data, forKey: "todoList")
            userDefaults.synchronize()
        }
    
    }
}
