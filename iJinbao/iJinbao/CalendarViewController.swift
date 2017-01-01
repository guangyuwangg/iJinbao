//
//  CalendarViewController.swift
//  iJinbao
//
//  Created by Guangyu Wang on 2016-12-29.
//  Copyright © 2016 jinbao. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class CalendarViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func clickedLogout(_ sender: Any) {
        var header: HTTPHeaders = [
            "Origin":RegisterViewController.baseURL,
            "Referer": RegisterViewController.baseURL+"/api/v1/logout"]
        
        for cookie in HTTPCookieStorage.shared.cookies! {
            if cookie.name == "jinbao.csrf.token" {
                header["csrf-token"] = cookie.value
            }
        }
        Alamofire.request(RegisterViewController.baseURL+"/api/v1/logout", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            let statusCode = response.response?.statusCode
            print("Status code: \(statusCode)")
            
//            _ = self.navigationController?.popToRootViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
        }
    }
}
