
//
//  memoViewController.swift
//  setuyaku
//
//  Created by keniku_macbook on 2018/06/01.
//  Copyright © 2018年 keniku_macbook. All rights reserved.
//howmucharrayがうまく保存されない ==>解決11/24
//arrayの中身が表示されない ==>解決11/24
//howmucharrayをInt型に

import UIKit

class memoViewController: UIViewController {
    
    var YoubiNo = ""
    var memoNo = ""
    @IBOutlet var WhatTextField: UITextField!
    @IBOutlet var HowmuchTextField: UITextField!
    
    var Whatarray:[String] = []
    var Howmucharray:[Int] = []
    var titlenamearraycount:Int = 0
    
    let saves = UserDefaults.standard
    
    //保存
    @IBAction func saveButton(sender: AnyObject) {
        if (WhatTextField.text?.isEmpty)!{
            
            let alert: UIAlertController = UIAlertController(title: "保存できません", message: "何に使ったかを入力してください。", preferredStyle: .alert)
            // アラートにボタンをつける
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            // アラート表示
            self.present(alert, animated: true, completion: nil)
            
        }else{
            if (HowmuchTextField.text?.isEmpty)! {
                let alert: UIAlertController = UIAlertController(title: "保存できません", message: "値段を入力してください。", preferredStyle: .alert)
                
                // アラートにボタンをつける
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                // アラート表示
                self.present(alert, animated: true, completion: nil)
            }else if memoNo != "0"{
                Whatarray[Int(memoNo)!] = WhatTextField.text!
                Howmucharray[Int(memoNo)!] = Int(HowmuchTextField.text!)!
                saves.set(Whatarray, forKey: "what"+YoubiNo)
                saves.set(Howmucharray, forKey: "howmuch"+YoubiNo)
                WhatTextField.text = ""
                HowmuchTextField.text = ""
                
                // アラートを作成
                let alert = UIAlertController(
                    title: "保存完了", message: "保存しました", preferredStyle: .alert)
                
                // アラートにボタンをつける
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
                    self.performSegue(withIdentifier: "toK", sender: nil)}))
                
                // アラート表示
                self.present(alert, animated: true, completion: nil)
            }else {
                Whatarray.append(WhatTextField.text!)
                Howmucharray.append(Int(HowmuchTextField.text!)!)
                saves.set(Whatarray, forKey: "what"+YoubiNo)
                saves.set(Howmucharray, forKey: "howmuch"+YoubiNo)
                WhatTextField.text = ""
                HowmuchTextField.text = ""
                
                saves.set(Whatarray.count - 1, forKey: "setuyaku")
                
                // アラートを作成
                let alert = UIAlertController(
                    title: "保存完了", message: "保存しました", preferredStyle: .alert)
                
                // アラートにボタンをつける
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
                    self.performSegue(withIdentifier: "toK", sender: nil)}))
                
                // アラート表示
                self.present(alert, animated: true, completion: nil)
                
            }
            
            print(Whatarray)
            print(Howmucharray)
        }
        
    }

    override func viewDidLoad() {
        
//        Whatarray = saves.object(forKey: "what"+YoubiNo+memoNo) as! [String]
        
        //情報を取り出す
        Whatarray = saves.object(forKey: "what"+YoubiNo) as! [String]
        Howmucharray = saves.object(forKey: "howmuch"+YoubiNo) as! [Int]
        print("how",Howmucharray)
        print("what",Whatarray)
        print("memoNo",memoNo)

        if memoNo != "0"{
            WhatTextField.text = String(Whatarray[Int(memoNo)!])
            HowmuchTextField.text = String(Howmucharray[Int(memoNo)!])
        }else{
            WhatTextField.text = "何に"
            HowmuchTextField.text = "何円"
        }
        
        print("Whatarray",Whatarray)
        print("何に",Whatarray[Int(memoNo)!])
        print("Howmucharray",Howmucharray)
//        print("何円",Howmucharray[Int(memoNo)!])
        print(YoubiNo+"曜日")
        print(memoNo+"メモNo")
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func deletememo () {
        //        saves.removeObject(forKey: "myTitle"+memoNo)
        //        saves.removeObject(forKey: "myText"+memoNo)
        
        print(memoNo)
        
        if memoNo == "0" {
            let alert = UIAlertController(
                title: "削除不可", message: "消去できません", preferredStyle: .alert)
            
            // アラートにボタンをつける
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            // アラート表示
            self.present(alert, animated: true, completion: nil)
        }
        
        Whatarray.remove(at: Int(memoNo)!)
        Howmucharray.remove(at: Int(memoNo)!)
        
        saves.set(Whatarray, forKey: "what"+YoubiNo)
        saves.set(Howmucharray, forKey: "howmuch"+YoubiNo)
        
        saves.set(Whatarray.count - 1, forKey: "what"+YoubiNo)
        
        // アラートを作成
        let alert = UIAlertController(
            title: "削除", message: "消去しました", preferredStyle: .alert)
        
        // アラートにボタンをつける
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
            self.dismiss(animated: true, completion: nil)}))
        
        // アラート表示
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func back () {
        self.dismiss(animated: true, completion: nil)
    }
    
    // Segueを設定
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toK" {
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
