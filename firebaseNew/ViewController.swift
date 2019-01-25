//
//  ViewController.swift
//  firebaseNew
//
//  Created by Felix-ITS 004 on 14/12/18.
//  Copyright © 2018 sonal. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    var ref : DatabaseReference!
    var courseDic = NSMutableDictionary()

    @IBOutlet var txtfld1: UITextField!
    
    @IBOutlet var textfld2: UITextField!
    
    @IBOutlet var txtfld3: UITextField!
    
    @IBOutlet var txtfld4: UITextField!
    
   
    @IBAction func btsave(_ sender: UIButton) {
      ref = Database.database().reference()
        courseDic.setValue(txtfld1.text!, forKey: "Name")
        courseDic.setValue(textfld2.text!, forKey: "Duration")
        courseDic.setValue(txtfld3.text!, forKey: "fees")
        courseDic.setValue(txtfld4.text!, forKey: "teacher")
        
        ref.child("Courses").childByAutoId().setValue(courseDic){(error, reference) in
            
            if((error) != nil)
            {
                print("Failed to Insert:\(error?.localizedDescription)")
            }
            else
            {
                print("insert: Success")
            }
            
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
