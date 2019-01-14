//
//  ElementsViewController.swift
//  Storyboarding
//
//  Created by Stephen Ouyang on 1/14/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

class ElementsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    var test: String?
    let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    var elementTableView: UITableView!
    
//    let storyElements: [String : String] = [
//        "Adventure": "Adventure Stuff",
//        "Horror": "Horror Stuff",
//        "Sci-Fi": "Sci-Fi Stuff",
//        "Romance": "Romance Stuff",
//        "Mystery": "Mystery Stuff"
//    ]
    
    let storyElements: [Expandables] = [
        Expandables(expanded: false, descriptions: ["Adventure Stuff"]),
        Expandables(expanded: false, descriptions: ["Horror Stuff"]),
        Expandables(expanded: false, descriptions: ["Sci-Fi Stuff"]),
        Expandables(expanded: false, descriptions: ["Romance Stuff"]),
        Expandables(expanded: false, descriptions: ["Mystery Stuff"])
    ]
    var headerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        // navigation bar attributes
        navigationItem.title = "Storyboarding"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        // Creates header view
        headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 75))
        headerView.backgroundColor = .lightGray
        view.addSubview(headerView)
        
        // Initialize frame components of the tableview
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // create and add tableview to the view
        elementTableView = UITableView(frame: CGRect(x: 0, y: headerView.frame.height, width: displayWidth, height: displayHeight))
        elementTableView.estimatedRowHeight = 200
        elementTableView.rowHeight = UITableView.automaticDimension
        elementTableView.register(UITableViewCell.self, forCellReuseIdentifier: "normalCell")
        elementTableView.delegate = self
        elementTableView.dataSource = self
//        elementTableView.separatorColor = .clear
        self.view.addSubview(elementTableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = elementTableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        return cell
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
