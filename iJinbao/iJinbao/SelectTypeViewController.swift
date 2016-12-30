//
//  SelectTypeViewController.swift
//  iJinbao
//
//  Created by Guangyu Wang on 2016-12-28.
//  Copyright © 2016 jinbao. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class SelectTypeViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginVendor" {
            let destVC = segue.destination as! LoginViewController
            destVC.loginType = LoginType.Vendor
        } else if segue.identifier == "loginCustomer" {
            let destVC = segue.destination as! LoginViewController
            destVC.loginType = LoginType.Client
        }
    }
    @IBAction func logout(_ sender: Any) {
        var header: HTTPHeaders = [
            "Origin":RegisterViewController.baseURL,
            "Referer": RegisterViewController.baseURL+"/api/v1/logout"]
        
        for cookie in HTTPCookieStorage.shared.cookies! {
            if cookie.name == "jinbao.csrf.token" {
                header["csrf-token"] = cookie.value
            }
        }
        Alamofire.request(RegisterViewController.baseURL+"/api/v1/logout", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            var statusCode = response.response?.statusCode
            print("Status code: \(statusCode)")
        }
    }
}

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
