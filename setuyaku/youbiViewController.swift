//
//  youbiViewController.swift
//  setuyaku
//
//  Created by keniku_macbook on 2018/06/01.
//  Copyright © 2018年 keniku_macbook. All rights reserved.
//

import UIKit


class youbiViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
//  UITableViewDataSource
    
    var memoNo = ""
    var YoubiNo = ""

    var Yarray:[String] = ["月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日", "日曜日"]
    
    @IBOutlet var Ytable:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    //セルの総数を設定するメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Yarray.count
    }
    
    //セルの値を設定するメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        //Cellのフォント
        cell.textLabel!.font = UIFont(name: "Noto Sans CJK JP Bold", size: 20)
        //cellのタイトル
        Yarray = ["月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日", "日曜日"]
        cell.textLabel!.text = Yarray[indexPath.row]
        
        return cell
    }
    
    //セルがタップされた時に呼び出されるメソッド
    
    func tableView(_ didSelectRowAttableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.YoubiNo = String(indexPath.row)
        self.performSegue(withIdentifier: "toKiroku", sender: nil)
        print(YoubiNo)
    }
    
    // Segueを設定
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toKiroku" {
            let subVC: kirokuViewController = (segue.destination as? kirokuViewController)!
//            subVC.memoNo = self.memoNo
            subVC.YoubiNo = self.YoubiNo
            print(YoubiNo)
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
