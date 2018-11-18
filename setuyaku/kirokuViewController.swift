//
//  kirokuViewController.swift
//  setuyaku
//
//  Created by keniku_macbook on 2018/06/01.
//  Copyright © 2018年 keniku_macbook. All rights reserved.
////cellををタップしてmemoviewに入るときに、うまく表示されない

//11月10日howmucharrayに値がうまく入らない

import UIKit

class kirokuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var YoubiNo = ""
    var memoNo = ""
    
    @IBOutlet var YoubiTitle:UILabel!

    @IBOutlet var table: UITableView!
    
    var saves = UserDefaults.standard
    
    var Whatarray:[String] = ["新規作成"]
    var Howmucharray:[String] = ["新規作成"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewDidDisappear(animated)
        table.reloadData()
        
        print(YoubiNo)
        
        //曜日ごとのデータを取る
//        Whatarray = saves.object(forKey: "what"+YoubiNo+memoNo) as! [String]
//        Howmucharray = saves.object(forKey: "howmuch"+YoubiNo+memoNo) as! [String]
        
        //
        
        if Int(YoubiNo) == 0 {
            YoubiTitle.text = "月曜日"
        }else if Int(YoubiNo) == 1 {
            YoubiTitle.text = "火曜日"
        }else if Int(YoubiNo) == 2{
            YoubiTitle.text = "水曜日"
        }else if Int(YoubiNo) == 3 {
            YoubiTitle.text = "木曜日"
        }else if Int(YoubiNo) == 4 {
            YoubiTitle.text = "金曜日"
        }else if Int(YoubiNo) == 5 {
            YoubiTitle.text = "土曜日"
        }else if Int(YoubiNo) == 6 {
            YoubiTitle.text = "日曜日"
        }
        
        if  saves.object(forKey: "what"+YoubiNo+memoNo) as? [String] != nil{
            Whatarray = saves.object(forKey: "what"+YoubiNo+memoNo) as! [String]
            //            titlenamearray.insert("新規作成", at: 0)
        }else{
            Whatarray = ["新規作成"]
            saves.set(Whatarray, forKey: "what"+YoubiNo+memoNo)
            Howmucharray = [""]
            saves.set(Howmucharray, forKey: "howmuch"+YoubiNo+memoNo)
        }

    saves.set(Whatarray.count - 1, forKey: "whatnumber"+YoubiNo+memoNo)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //セルの総数を設定するメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Whatarray.count
    }
    
    //セルの値を設定するメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        //Cellのフォント
        cell.textLabel!.font = UIFont(name: "Noto Sans CJK JP Bold", size: 20)
        //cellのタイトル
        cell.textLabel!.text = Whatarray[indexPath.row]
        
        return cell
    }
    
//    @IBAction func memoplus () {
//        memoNo = ""
//        performSegue(withIdentifier: "toMemo", sender: self)
//    }
    
    //セルがタップされた時に呼び出されるメソッド
    
    func tableView(_ didSelectRowAttableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.memoNo = String(indexPath.row)
        self.performSegue(withIdentifier: "toMemo", sender: nil)
    }
    
    // Segueを設定
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMemo" {
            let subVC: memoViewController = (segue.destination as? memoViewController)!
            subVC.memoNo = self.memoNo
            subVC.YoubiNo = self.YoubiNo
        }
    }
    
    @IBAction func back () {
        self.dismiss(animated: true, completion: nil)
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
