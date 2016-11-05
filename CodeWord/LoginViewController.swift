//
//  ViewController.swift
//  CodeWord
//
//  Created by Akhil Tirumalasetty on 9/4/16.
//  Copyright © 2016 Akhil Tirumalasetty. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var height: NSLayoutConstraint!
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //height.constant=60
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        userName.text=""
        password.text=""
    }
    @IBAction func loginButton(sender: AnyObject) {
        
        let url = NSBundle.mainBundle().URLForResource("Login", withExtension: "json")
        let data = NSData(contentsOfURL: url!)
        
        do {
            let object = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            if let dictionary = object as? [String: AnyObject] {
                print("Dictionary",dictionary["userName"]!)
                
                if(dictionary["userName"] as! String==userName.text! && dictionary["password"]as! String==password.text!){
                    print("userName.text",(userName.text)!)
                    print("SUCCESS")
                }
                else{
                    let alertController = UIAlertController(title: "Authentication Failed", message:
                        "Check User Name And Password", preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default,handler: nil))
                   
                    self.presentViewController(alertController, animated: true, completion: nil)
                    userName.text=""
                    password.text=""
                }
                
            }
        } catch {
            // Handle Error
        }
        
        
            }
    

       override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier=="ListView"){
        segue.destinationViewController as! ListViewController
        }
     }
 
    
  


    
    

}

