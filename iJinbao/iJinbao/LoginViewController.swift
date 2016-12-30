//
//  LoginViewController.swift
//  iJinbao
//
//  Created by Guangyu Wang on 2016-12-28.
//  Copyright © 2016 jinbao. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

// Type of login. Decide the flow
enum LoginType {
    case Client
    case Vendor
}

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var loginType: LoginType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        
        if loginType == LoginType.Client {
            welcomeLabel.text = "Welcome, Customer!"
        } else {
            welcomeLabel.text = "Welcome, Vendor!"
        }
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToRegister" {
            let destVC = segue.destination as! RegisterViewController
            destVC.loginType = self.loginType
        }
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        let params: Parameters = [
            "username": userNameTextfield.text ?? "",
            "vendor": "true",
            "password": passwordTextfield.text ?? ""
        ]
        
        
        
        var header: HTTPHeaders = ["Origin":RegisterViewController.baseURL,
                                   "Referer": RegisterViewController.baseURL+"/login"]
        Alamofire.request(RegisterViewController.baseURL+"/login", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            for cookie in HTTPCookieStorage.shared.cookies! {
                if cookie.name == "jinbao.login.nonce" {
                    header["login-nonce"] = cookie.value
                }
            }
            
            Alamofire.request(RegisterViewController.baseURL+"/api/v1/login", method: .post, parameters: params, encoding: JSONEncoding.default, headers: header).response(completionHandler: { (reqResponse) in
                
                let statusCode = reqResponse.response?.statusCode
                if statusCode == 200 {
                    self.performSegue(withIdentifier: "loginSuccess", sender: self)
                }
            })
            
        }
    }
}
