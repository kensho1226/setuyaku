//
//  kakodataViewController.swift
//  setuyaku
//
//  Created by keniku_macbook on 2018/06/22.
//  Copyright © 2018年 keniku_macbook. All rights reserved.
// sumが0のときarrayに入れないようにする　官僚

import UIKit

class kakodataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {    
    
    var saves = UserDefaults.standard
    var data:[Int] = []
    
    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        table.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewDidDisappear(animated)
        if saves.object(forKey: "kiroku") != nil {
        data = saves.object(forKey: "kiroku") as! [Int]
        }else{
            data = [0]
        }
        table.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //セルの値を設定するメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        //Cellのフォント
        cell.textLabel!.font = UIFont(name: "Noto Sans CJK JP Bold", size: 20)
        //cellのタイトル
        cell.textLabel!.text = String(data[indexPath.row])
        
        return cell
    }
    
    //セルの総数を設定するメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
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
