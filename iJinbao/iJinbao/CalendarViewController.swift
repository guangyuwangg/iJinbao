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
        
        // remove the back button
        self.navigationItem.leftBarButtonItems?.removeAll()
    }
}
