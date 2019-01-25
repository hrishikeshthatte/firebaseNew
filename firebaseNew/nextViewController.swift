//
//  nextViewController.swift
//  firebaseNew
//
//  Created by Felix-ITS 004 on 17/12/18.
//  Copyright © 2018 sonal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class nextViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
      var arrrcv = [String]()
      var arrrcv1 = [String]()
      var arrrcv2 = [String]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrrcv.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")as! cellTableViewCell
        
        cell.lbldata1?.text = arrrcv[indexPath.row]
        cell.lbldata2?.text = arrrcv1[indexPath.row]
        cell.lbldata3?.text = arrrcv2[indexPath.row]
        return cell
    }
 

    @IBOutlet var tblvwData: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tblvwData.dataSource = self
        tblvwData.delegate = self
        var reference : DatabaseReference
        reference = Database.database().reference()
        reference.observeSingleEvent(of: .value, with: {(snapshot) in
            let dic : NSDictionary = snapshot.value as! NSDictionary
            print(dic)
            let courseDic: NSDictionary = dic["Courses"] as! NSDictionary
            for  item in courseDic.allKeys
            {
                let lastDic : NSDictionary = courseDic[item] as! NSDictionary
                let name : String = lastDic["Name"]as! String
                let duration : String = lastDic["Duration"]as! String
                let feeess : String = lastDic["fees"]as! String
                print(name)
                print(duration)
                print(feeess)
                self.arrrcv.append(name)
                self.arrrcv1.append(duration)
                self.arrrcv2.append(feeess)
                print(self.arrrcv)
                print(self.arrrcv1)
                print(self.arrrcv2)
                self.tblvwData.reloadData()
            }
        })
        
        tblvwData.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
