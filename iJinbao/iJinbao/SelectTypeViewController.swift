//
//  SelectTypeViewController.swift
//  iJinbao
//
//  Created by Guangyu Wang on 2016-12-28.
//  Copyright © 2016 jinbao. All rights reserved.
//

import Foundation
import UIKit

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
}
