//
//  LoginViewController.swift
//  iJinbao
//
//  Created by Guangyu Wang on 2016-12-28.
//  Copyright © 2016 jinbao. All rights reserved.
//

import Foundation
import UIKit

// Type of login. Decide the flow
enum LoginType {
    case Client
    case Vendor
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var loginType: LoginType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    
    @IBAction func loginClicked(_ sender: Any) {
        
    }
}
