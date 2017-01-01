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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItems?.removeAll()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginVendor" {
            let destVC = segue.destination as! LoginViewController
            destVC.loginType = LoginType.Vendor
        } else if segue.identifier == "loginCustomer" {
            let destVC = segue.destination as! LoginViewController
            destVC.loginType = LoginType.Client
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
