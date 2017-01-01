//
//  SplashViewController.swift
//  iJinbao
//
//  Created by Guangyu Wang on 2016-12-29.
//  Copyright © 2016 jinbao. All rights reserved.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        // if registered, go to calendar
        for cookie in HTTPCookieStorage.shared.cookies! {
            if cookie.name == "jinbao.csrf.token" {
                let profileScreen = self.storyboard?.instantiateViewController(withIdentifier: "calendarViewController") as! UINavigationController
                profileScreen.modalTransitionStyle = .crossDissolve
                self.present(profileScreen, animated: true, completion: nil)
            }
        }
        
        // otherwise show user type selection screen
        self.performSegue(withIdentifier: "showSelectUserType", sender: self)
    }
}
