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
    
    @IBOutlet var chartView: PieChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        chartView.delegate = self as? ChartViewDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

