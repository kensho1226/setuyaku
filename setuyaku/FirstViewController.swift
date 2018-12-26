
//
//  FirstViewController.swift
//  setuyaku
//
//  Created by keniku_macbook on 2018/06/22.
//  Copyright © 2018年 keniku_macbook. All rights reserved.
//

import UIKit
import Charts

class FirstViewController: UIViewController {
    
    var mokuhyou:Int = 0
    @IBOutlet var mokuhyoulabel:UILabel!
    
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
    
    var saves = UserDefaults.standard
    var sum: Int = 0
    @IBOutlet var sumlabel:UILabel!
    
    @IBOutlet weak var pieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if saves.object(forKey: "objective") as? Int != nil {
            mokuhyou = saves.object(forKey: "objective") as! Int
        }
        mokuhyou = 0
        mokuhyoulabel.text = String(mokuhyou)+"円"
        
        
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
        
        mon = Mon.reduce(0) {(num1: Int, num2: Int) -> Int in return num1 + num2 }
        tue = Tue.reduce(0) {(num1: Int, num2: Int) -> Int in return num1 + num2 }
        wed = Wed.reduce(0) {(num1: Int, num2: Int) -> Int in return num1 + num2 }
        thu = Thu.reduce(0) {(num1: Int, num2: Int) -> Int in return num1 + num2 }
        fri = Fri.reduce(0) {(num1: Int, num2: Int) -> Int in return num1 + num2 }
        sat = Sat.reduce(0) {(num1: Int, num2: Int) -> Int in return num1 + num2 }
        sun = Sun.reduce(0) {(num1: Int, num2: Int) -> Int in return num1 + num2 }
        
        sum = mon + tue + wed + thu + fri + sat + sun
        
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

}
