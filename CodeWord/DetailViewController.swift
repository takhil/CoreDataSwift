//
//  DetailViewController.swift
//  CodeWord
//
//  Created by Akhil Tirumalasetty on 9/12/16.
//  Copyright © 2016 Akhil Tirumalasetty. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var dataObject:AnyObject?
    
    @IBOutlet weak var titleLabel: UILabel!
     @IBOutlet weak var hintLabel: UILabel!
     @IBOutlet weak var userIDLabel: UILabel!
     @IBOutlet weak var emailLabel: UILabel!
     @IBOutlet weak var passwordLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("SHOW DETAIL :: \(dataObject)")
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        titleLabel.text     = dataObject?.valueForKey("title") as? String
        
        hintLabel.text      = dataObject?.valueForKey("hint") as?String
        userIDLabel.text    = dataObject?.valueForKey("uname") as?
            String
        emailLabel.text     = dataObject?.valueForKey("email")  as? String
        passwordLabel.text  = dataObject?.valueForKey("password")as? String
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
