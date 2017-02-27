//
//  ModelVersionController.swift
//  BinMarker
//
//  Created by 彭子上 on 2016/11/18.
//  Copyright © 2016年 彭子上. All rights reserved.
//

import UIKit
class ModelVersionController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    public var versionList : NSArray!
    public var deviceType : NSIndexPath!
    public var brandName : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return versionList.count
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "brandCell", for: indexPath as IndexPath) as UITableViewCell
        let  brandTitle=cell .viewWithTag(1001) as! UILabel;
        brandTitle.text=versionList.object(at: indexPath.row) as? String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var deviceTypeStr = String.init();
        switch deviceType.row {
        case 0:
            deviceTypeStr="TV"
        case 1:
            deviceTypeStr="DVD"
        case 2:
            deviceTypeStr="COMBI"
        case 3:
            deviceTypeStr="SAT"
        default: break
        }
        
        let deviceSubInfoDic:Dictionary<String,String>=["deviceType" : deviceTypeStr,"brandName" : brandName,"versionName" : (versionList.object(at: indexPath.row) as? String)!]
        self.performSegue(withIdentifier: "debug", sender: deviceSubInfoDic)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "debug" {
            let target=segue.destination as! TestController;
            let deviceSubInfoDic:Dictionary<String,String>=sender as! Dictionary
            
            target.version=deviceSubInfoDic["versionName"]
            target.brandName=deviceSubInfoDic["brandName"]
            target.deviceType=deviceSubInfoDic["deviceType"]
        }
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
    
    
}
