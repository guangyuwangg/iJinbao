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

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendRegistration(_ sender: Any) {
        let params: Parameters = [
            "email": emailField.text ?? "",
            "password": passwordField.text ?? "",
            "name": nameField.text ?? "",
            "wechat": wechatField.text ?? "",
            "phone": phoneField.text ?? ""
        ]
        
        
        Alamofire.request("https://jinbao.herokuapp.com/api/v1/vendor", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            guard response.result.isSuccess else {
                print("Failed to register!")
                return
            }
            
            guard let value = response.result.value as? [String: AnyObject], let calendarId = value["calendarid"], let vendorId = value["vendorid"] else {
                print("Wrong format of response received!")
                return
            }
            
            print(calendarId)
            print(vendorId)
        }
    }
}
