//
//  newViewController.swift
//  Storyboarding
//
//  Created by Stephen Ouyang on 1/10/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

class newViewController: UIViewController {
    
    let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Storyboarding"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        navigationItem.rightBarButtonItem?.tintColor = .white
        view.backgroundColor = .white

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
