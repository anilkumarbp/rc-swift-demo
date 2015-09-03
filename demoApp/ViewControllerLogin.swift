//
//  ViewController.swift
//  demoApp
//
//  Created by Anil Kumar BP on 8/29/15.
//  Copyright (c) 2015 RingCentral. All rights reserved.
//

import UIKit

//import platform/Platform.swift




class ViewControllerLogin: UIViewController {

    // definfing the text fields

    @IBOutlet weak var keyBox: UITextField!
    @IBOutlet weak var secretBox: UITextField!
    @IBOutlet weak var userBox: UITextField!
    @IBOutlet weak var passBox: UITextField!
    
    
    
  var rcsdk = SDK(appKey: "", appSecret: "", server: "")
//    
   // var platform = rcsdk.getPlatform()
    // Declare the server variable
    var setServer: String? = nil
    
    // Declare the platform object
  //  var platform: Platform!
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            println("first segement clicked")
            //setServer = SDK.RC_SERVER_SANDBOX
        case 1:
            println("second segment clicked")
            //setServer = SDK.RC_SERVER_PRODUCTION
        case 2:
            println("third segemnet clicked")
        default:
            break;
        }  //Switch
        
    }
    
    @IBAction func login(sender: AnyObject) {

        var rcsdk = SDK(appKey: keyBox.text, appSecret: secretBox.text, server: SDK.RC_SERVER_SANDBOX)
        var platform = rcsdk.getPlatform()
        
        platform.apiCall(<#options: [String : AnyObject]#>)
        
        
        self.platform = platform
        platform.authorize(userBox.text, password: passBox.text)
        
        if platform.auth != nil && platform.auth!.authenticated {
            performSegueWithIdentifier("loginToMain", sender: nil)
        } else {
            shakeButton(sender)
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

