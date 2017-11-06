//
//  ViewController.swift
//  ACLogstasher
//
//  Created by antoine20001 on 11/02/2017.
//  Copyright (c) 2017 antoine20001. All rights reserved.
//

import UIKit
import ACLogstasher

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let logger = ACLogger.init(index: Bundle.main.bundleIdentifier ?? "null")
        logger.info("message plop", error: nil, userInfo: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

