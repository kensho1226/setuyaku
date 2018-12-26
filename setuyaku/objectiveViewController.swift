//
//  objectiveViewController.swift
//  setuyaku
//
//  Created by 畑川健勝 on 2018/12/08.
//  Copyright © 2018年 keniku_macbook. All rights reserved.
//

import UIKit

class objectiveViewController: UIViewController {
    
    var saves = UserDefaults.standard
    var mokuhyou:Int = 0
    @IBOutlet var mokuhyoutextfield:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if saves.object(forKey: "objective") as? Int != nil {
            mokuhyou = saves.object(forKey: "objective") as! Int
            mokuhyoutextfield.text = String(mokuhyou)
        }else{
            mokuhyoutextfield.text = "設定されていません"
        }
    }
    
    @IBAction func change () {
        if (mokuhyoutextfield.text?.isEmpty)!{
            
            let alert: UIAlertController = UIAlertController(title: "保存できません", message: "何に使ったかを入力してください。", preferredStyle: .alert)
            // アラートにボタンをつける
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            // アラート表示
            self.present(alert, animated: true, completion: nil)
        }else{
            mokuhyou = (Int(mokuhyoutextfield.text!))!
            saves.set(mokuhyou, forKey: "objective")
            // アラートを作成
            let alert = UIAlertController(
                title: "保存完了", message: "保存しました", preferredStyle: .alert)
            
            // アラートにボタンをつける
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in
                self.performSegue(withIdentifier: "toFirst", sender: nil)}))
            
            // アラート表示
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
