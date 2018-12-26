//
//  youbiViewController.swift
//  setuyaku
//
//  Created by keniku_macbook on 2018/06/01.
//  Copyright © 2018年 keniku_macbook. All rights reserved.
//

import UIKit


class youbiViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//  UITableViewDataSource
    
//    var memoNo = ""
    var YoubiNo = ""
    var Yarray:[String] = ["月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日", "日曜日"]
    var goukei:Int = 0
    
    var saves = UserDefaults.standard

    @IBOutlet var goukeilabel:UILabel!
    @IBOutlet var Ytable:UITableView!
    var howmucharray:[Int] = []
    var Mon:[Int] = []
    var Tue:[Int] = []
    var Wed:[Int] = []
    var Thu:[Int] = []
    var Fri:[Int] = []
    var Sat:[Int] = []
    var Sun:[Int] = []
    
    var mon:Int = 0
    var tue:Int = 0
    var wed:Int = 0
    var thu:Int = 0
    var fri:Int = 0
    var sat:Int = 0
    var sun:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if saves.object(forKey: "howmuch0") != nil {
            Mon = saves.object(forKey:"howmuch0") as! [Int]
            print(Mon)
        }
        if saves.object(forKey: "howmuch1") != nil {
            Tue = saves.object(forKey:"howmuch1") as! [Int]
            print(Tue)
        }
        if saves.object(forKey: "howmuch2") != nil {
            Wed = saves.object(forKey:"howmuch2") as! [Int]
            print(Wed)
        }
        if saves.object(forKey: "howmuch3") != nil {
            Thu = saves.object(forKey:"howmuch3") as! [Int]
            print(Thu)
        }
        if saves.object(forKey: "howmuch4") != nil {
            Fri = saves.object(forKey:"howmuch4") as! [Int]
            print(Fri)
        }
        if saves.object(forKey: "howmuch5") != nil {
            Sat = saves.object(forKey:"howmuch5") as! [Int]
            print(Sat)
        }
        if saves.object(forKey: "howmuch6") != nil {
            Sun = saves.object(forKey:"howmuch6") as! [Int]
            print(Sun)
        }
        
        goukei = Mon.reduce(0) {(num1: Int, num2: Int) -> Int in return num1 + num2 } +
            Tue.reduce(0) {(num1: Int, num2: Int) -> Int in return num1 + num2 } +
            Wed.reduce(0) {(num1: Int, num2: Int) -> Int in return num1 + num2 } +
            Thu.reduce(0) {(num1: Int, num2: Int) -> Int in return num1 + num2 } +
            Fri.reduce(0) {(num1: Int, num2: Int) -> Int in return num1 + num2 } +
            Sat.reduce(0) {(num1: Int, num2: Int) -> Int in return num1 + num2 } +
            Sun.reduce(0) {(num1: Int, num2: Int) -> Int in return num1 + num2 }
        
        
        print(goukei)
        goukeilabel.text = String(goukei) + "円"
        saves.set(goukei, forKey: "sum")
//        goukei = howmucharray.reduce(0) {(num1: Int, num: Int)->Int in}
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
        
        if segue.identifier == "toFirst" {
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back () {
        self.performSegue(withIdentifier: "toFirst", sender: nil)
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
