//
//  ViewController.swift
//  setuyaku
//
//  Created by keniku_macbook on 2018/02/15.
//  Copyright © 2018年 keniku_macbook. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    var sagaku:Int = 0
    @IBOutlet var sagakuL:UILabel!
    var saves = UserDefaults.standard
    var mokuhyou:Int = 0
    var goukei:Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        chartView.delegate = self as? ChartViewDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        goukei = saves.integer(forKey: "sum")
        mokuhyou = saves.integer(forKey: "objective")
        sagaku = mokuhyou - goukei
        sagakuL.text = String(sagaku) + "円"
    }
    
    @IBAction func back () {
        self.dismiss(animated: true, completion: nil)
    }
}

