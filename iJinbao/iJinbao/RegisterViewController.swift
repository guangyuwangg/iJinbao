//
//  LoginViewCRegisterViewController.swift
//  iJinbao
//
//  Created by Guangyu Wang on 2016-12-28.
//  Copyright © 2016 jinbao. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var wechatField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var wechatText: UILabel!
    @IBOutlet weak var phoneText: UILabel!
    @IBOutlet weak var addressText: UILabel!

    var loginType: LoginType?
    
    static var baseURL = "https://jinbao.herokuapp.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        
        // hide fields not needed for customer
        if loginType == LoginType.Client {
            nameField.isHidden = true
            wechatField.isHidden = true
            phoneField.isHidden = true
            addressField.isHidden = true
            nameText.isHidden = true
            wechatText.isHidden = true
            phoneText.isHidden = true
            addressText.isHidden = true
        }
    }
    
    @IBAction func sendRegistration(_ sender: Any) {
        let params: Parameters = [
            "register": true,
            "username": emailField.text ?? "",
            "vendor": (loginType == LoginType.Vendor) ? "true" : "false",
            "password": passwordField.text ?? "",
            "name": nameField.text ?? "",
            "wechat": wechatField.text ?? "",
            "phone": phoneField.text ?? ""
        ]
        
    

        var header: HTTPHeaders = ["Origin":RegisterViewController.baseURL,
                                   "Referer": RegisterViewController.baseURL]
        Alamofire.request(RegisterViewController.baseURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            for cookie in HTTPCookieStorage.shared.cookies! {
                if cookie.name == "jinbao.login.nonce" {
                    header["login-nonce"] = cookie.value
                }
            }
            
            Alamofire.request(RegisterViewController.baseURL+"/api/v1/login", method: .post, parameters: params, encoding: JSONEncoding.default, headers: header).response(completionHandler: { (reqResponse) in
                
                let statusCode = reqResponse.response?.statusCode
                
                if statusCode == 200 {
                    self.performSegue(withIdentifier: "registerSuccess", sender: self)
                }
            })
            
        }
        
        

    }
}
