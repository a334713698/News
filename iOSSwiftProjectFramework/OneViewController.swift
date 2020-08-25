//
//  OneViewController.swift
//  iOSSwiftProjectFramework
//
//  Created by GG266 on 2020/8/7.
//  Copyright © 2020 hdj. All rights reserved.
//

import UIKit

class OneViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = RANDOM_COLOR

        self.navButtonLeft.isHidden = true
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
