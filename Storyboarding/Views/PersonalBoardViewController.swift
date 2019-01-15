//
//  PersonalBoardViewController.swift
//  Storyboarding
//
//  Created by Stephen Ouyang on 1/14/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

class PersonalBoardViewController: UIViewController {
    
    var storage: [String : [String]] = [:]
    let test: [Expandables] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        storage["test"] = ["one", "two", "three"]
        storage["case"] = ["one"]
        
        for index in 1...storage.count {
            print(index)
        }
        
//        test = [
//            Expandables(expanded: false, descriptions: storage[]
//        ]

        // Do any additional setup after loading the view.
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
