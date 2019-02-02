
//
//  FirstViewController.swift
//  setuyaku
//
//  Created by keniku_macbook on 2018/06/22.
//  Copyright © 2018年 keniku_macbook. All rights reserved.
//一週間のデータを新しい週に開いた1回めにリセットする
//今
//月曜日：判定用変数を0(未実行)に、データのリセットメソッドを呼び出し、その後判定用変数を1(実行済み)に
//火曜日：判定用変数を0にする
//問題点：月曜日に起動しないと実行されない。
//改善：

import UIKit
import Charts

class FirstViewController: UIViewController {
    
    var datakiroku:[Int] = []
    
    var mokuhyou:Int = 0
    @IBOutlet var mokuhyoulabel:UILabel!
    
    var weekday:String!
    
    // 使い方
    let date = Date()
    var datajudge:Int = 0
    
    var MonH:[Int] = []
    var TueH:[Int] = []
    var WedH:[Int] = []
    var ThuH:[Int] = []
    var FriH:[Int] = []
    var SatH:[Int] = []
    var SunH:[Int] = []
    
    var MonW:[String] = []
    var TueW:[String] = []
    var WedW:[String] = []
    var ThuW:[String] = []
    var FriW:[String] = []
    var SatW:[String] = []
    var SunW:[String] = []
    
    var mon:Int = 0
    var tue:Int = 0
    var wed:Int = 0
    var thu:Int = 0
    var fri:Int = 0
    var sat:Int = 0
    var sun:Int = 0
    
    var saves = UserDefaults.standard
    var sum: Int = 0
    @IBOutlet var sumlabel:UILabel!
    
    @IBOutlet weak var pieChartView: PieChartView!
    
    @IBAction func reset() {
        if sum != 0 {
            datakiroku.append(sum)
            saves.set(datakiroku, forKey: "kiroku")
            
        datajudge = 1
        saves.set(datajudge, forKey: "judge")
        MonH = []
        TueH = []
        WedH = []
        ThuH = []
        FriH = []
        SatH = []
        SunH = []
        
        MonW = []
        TueW = []
        WedW = []
        ThuW = []
        FriW = []
        SatW = []
        SunW = []
        
        saves.set(MonH, forKey: "howmuch0")
        saves.set(ThuH, forKey: "howmuch1")
        saves.set(WedH, forKey: "howmuch2")
        saves.set(ThuH, forKey: "howmuch3")
        saves.set(FriH, forKey: "howmuch4")
        saves.set(SatH, forKey: "howmuch5")
        saves.set(SunH, forKey: "howmuch6")
        saves.set(MonW, forKey: "what0")
        saves.set(TueW, forKey: "what1")
        saves.set(WedW, forKey: "what2")
        saves.set(ThuW, forKey: "what3")
        saves.set(FriW, forKey: "what4")
        saves.set(SatW, forKey: "what5")
        saves.set(SunW, forKey: "what6")
            
            // アラートを作成
            let alert = UIAlertController(
                title: "リセット", message: "データをリセットしました", preferredStyle: .alert)
            
            // アラートにボタンをつける
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            // アラート表示
            self.present(alert, animated: true, completion: nil)
        }else{
            // アラートを作成
            let alert = UIAlertController(
                title: "リセットできません", message: "使用金額が0円です", preferredStyle: .alert)
            
            // アラートにボタンをつける
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            // アラート表示
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if saves.object(forKey: "objective") as? Int != nil {
            mokuhyou = saves.object(forKey: "objective") as! Int
        }
        mokuhyou = 0
        mokuhyoulabel.text = String(mokuhyou)+"円"
        
        
        if saves.object(forKey: "howmuch0") != nil {
            MonH = saves.object(forKey:"howmuch0") as! [Int]
            print(MonH)
        }
        if saves.object(forKey: "howmuch1") != nil {
            TueH = saves.object(forKey:"howmuch1") as! [Int]
            print(TueH)
        }
        if saves.object(forKey: "howmuch2") != nil {
            WedH = saves.object(forKey:"howmuch2") as! [Int]
            print(WedH)
        }
        if saves.object(forKey: "howmuch3") != nil {
            ThuH = saves.object(forKey:"howmuch3") as! [Int]
            print(ThuH)
        }
        if saves.object(forKey: "howmuch4") != nil {
            FriH = saves.object(forKey:"howmuch4") as! [Int]
            print(FriH)
        }
        if saves.object(forKey: "howmuch5") != nil {
            SatH = saves.object(forKey:"howmuch5") as! [Int]
            print(SatH)
        }
        if saves.object(forKey: "howmuch6") != nil {
            SunH = saves.object(forKey:"howmuch6") as! [Int]
            print(SunH)
        }
        
        
        if saves.object(forKey: "what0") != nil {
            MonW = saves.object(forKey:"what0") as! [String]
            print(MonW)
        }
        if saves.object(forKey: "what1") != nil {
            TueW = saves.object(forKey:"what1") as! [String]
            print(TueW)
        }
        if saves.object(forKey: "what2") != nil {
            WedW = saves.object(forKey:"what2") as! [String]
            print(WedW)
        }
        if saves.object(forKey: "what3") != nil {
            ThuW = saves.object(forKey:"what3") as! [String]
            print(ThuW)
        }
        if saves.object(forKey: "what4") != nil {
            FriW = saves.object(forKey:"what4") as! [String]
            print(FriW)
        }
        if saves.object(forKey: "what5") != nil {
            SatW = saves.object(forKey:"what5") as! [String]
            print(SatW)
        }
        if saves.object(forKey: "what6") != nil {
            SunW = saves.object(forKey:"what6") as! [String]
            print(SunW)
        }
        
        
        
        //曜日からデータのリセット
        print(date.weekday)
        
        datajudge = saves.integer(forKey: "judge")
        
//        if date.weekday == "月曜日" && datajudge == 0{
//            if sum != 0 {
//                datakiroku.append(sum)
//                saves.set(datakiroku, forKey: "kiroku")
//            }
//            datajudge = 1
//            saves.set(datajudge, forKey: "judge")
//            MonH = []
//            TueH = []
//            WedH = []
//            ThuH = []
//            FriH = []
//            SatH = []
//            SunH = []
//
//            MonW = []
//            TueW = []
//            WedW = []
//            ThuW = []
//            FriW = []
//            SatW = []
//            SunW = []
//
//            saves.set(MonH, forKey: "howmuch0")
//            saves.set(ThuH, forKey: "howmuch1")
//            saves.set(WedH, forKey: "howmuch2")
//            saves.set(ThuH, forKey: "howmuch3")
//            saves.set(FriH, forKey: "howmuch4")
//            saves.set(SatH, forKey: "howmuch5")
//            saves.set(SunH, forKey: "howmuch6")
//            saves.set(MonW, forKey: "what0")
//            saves.set(TueW, forKey: "what1")
//            saves.set(WedW, forKey: "what2")
//            saves.set(ThuW, forKey: "what3")
//            saves.set(FriW, forKey: "what4")
//            saves.set(SatW, forKey: "what5")
//            saves.set(SunW, forKey: "what6")
//        }
//        if date.weekday == "火曜日" {
//            datajudge = 0
//            saves.set(datajudge, forKey: "judge")
//        }
        
        
        mon = MonH.reduce(0) {(num1: Int, num2: Int) -> Int in return num1 + num2 }
        tue = TueH.reduce(0) {(num1: Int, num2: Int) -> Int in return num1 + num2 }
        wed = WedH.reduce(0) {(num1: Int, num2: Int) -> Int in return num1 + num2 }
        thu = ThuH.reduce(0) {(num1: Int, num2: Int) -> Int in return num1 + num2 }
        fri = FriH.reduce(0) {(num1: Int, num2: Int) -> Int in return num1 + num2 }
        sat = SatH.reduce(0) {(num1: Int, num2: Int) -> Int in return num1 + num2 }
        sun = SunH.reduce(0) {(num1: Int, num2: Int) -> Int in return num1 + num2 }
        
        sum = mon + tue + wed + thu + fri + sat + sun
        
        saves.set(sum, forKey: "sum")
        saves.set(mon, forKey:"mon")
        saves.set(tue, forKey:"tue")
        saves.set(wed, forKey:"wed")
        saves.set(thu, forKey:"thu")
        saves.set(fri, forKey:"fri")
        saves.set(sat, forKey:"sat")
        saves.set(sun, forKey:"sun")
        
        print(sum)
        sumlabel.text = String(sum) + "円"
        saves.set(sum, forKey: "sum")
        
        //円グラフ作成
        pieChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        var money = [mon,tue,wed,thu,fri,sat,sun]
        var days = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
        var entries = [
            PieChartDataEntry(value: Double(mon), label: "Mon"),
            PieChartDataEntry(value: Double(tue), label: "Tue"),
            PieChartDataEntry(value: Double(wed), label: "Wed"),
            PieChartDataEntry(value: Double(thu), label: "Thu"),
            PieChartDataEntry(value: Double(fri), label: "Fri"),
            PieChartDataEntry(value: Double(sat), label: "Sat"),
            PieChartDataEntry(value: Double(sun), label: "Sun")]
        
        let set = PieChartDataSet(values: entries, label: "Data")
        pieChartView.data = PieChartData(dataSet: set)
        view.addSubview(pieChartView)
        
        pieChartView.chartDescription?.text = ""
        
        set.colors = ChartColorTemplates.vordiplom()
        
        let chartData = PieChartData(dataSet: set)
        
        pieChartView.data = chartData
//        let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat","Sun"]
//        let usedmoney = [mon, tue, wed, thu, fri, sat, sun]
//        getchar(dataPoints: days, values: usedmoney)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Segueを設定
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFirst" {
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mokuhyou = saves.object(forKey: "objective") as! Int
        mokuhyoulabel.text = String(mokuhyou)+"円"
        
        // 使い方
        print(date) // 2018-06-29 10:35:57 +0000
        print(date.weekday) // 金曜日
        print(date.toStringWithCurrentLocale())
    }
    }



extension Date {
    var weekday: String {
        var calendar = Calendar(identifier: .japanese)
        calendar.timeZone = TimeZone(identifier: "Asia/Tokyo")!
        calendar.locale = Locale(identifier: "ja")
        let component = calendar.component(.weekday, from: self)
        let weekday = component - 1
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja")
        return formatter.weekdaySymbols[weekday]
    }
    
    func toStringWithCurrentLocale() -> String {
        
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.current
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return formatter.string(from: self)
    }
}



//    func setupGraph() {
//
//
//    }
    
    
    

//    //appのクリーンアップ
//    @IBAction func removeUserDefaults() {
//        let appDomain = Bundle.main.bundleIdentifier
//        UserDefaults.standard.removePersistentDomain(forName: appDomain!)
//    }
//

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
