//
//  PersonalBoardViewController.swift
//  Storyboarding
//
//  Created by Stephen Ouyang on 1/14/19.
//  Copyright © 2019 Stephen Ouyang. All rights reserved.
//

import UIKit

class PersonalBoardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var storage: [String : [String]] = [:]
    var ideas: [Expandables] = []
    let storypersonals = [
        "Plot",
        "Conflict",
        "Characters",
        "Setting",
        "Resolution"
    ]
    var personalTableView: UITableView!
    var saveButtonItem: UIBarButtonItem!
    var headerView: UIView!
    var headerViewFrame: CGRect!
    var headerLabel: UILabel!
    var headerLabelFrame: CGRect!
    let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    var genreString: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0..<storypersonals.count {
            if storage[storypersonals[index]] == nil {
                storage[storypersonals[index]] = [""]
            }
        }
        
//        storage["test"] = ["one", "two", "three"]
//        storage["case"] = ["one"]
//
//        for index in 1...storage.count {
//            print(index)
//        }
//        view.backgroundColor = .white
//        var adventure = storage["test"]
//
//        test = [
//            Expandables(expanded: false, descriptions: adventure!)
//        ]
//
//        print(test)
        view.backgroundColor = .white
        print("data: \(storage)")
        ideas = [
            Expandables(expanded: false, descriptions: storage[storypersonals[0]]!),
            Expandables(expanded: false, descriptions: storage[storypersonals[1]]!),
            Expandables(expanded: false, descriptions: storage[storypersonals[2]]!),
            Expandables(expanded: false, descriptions: storage[storypersonals[3]]!),
            Expandables(expanded: false, descriptions: storage[storypersonals[4]]!),
        ]
        print(ideas)
        
        // Do any additional setup after loading the view.
        
        saveButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveTapped))
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        // navigation bar attributes
        navigationItem.title = "Storyboarding"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.rightBarButtonItem = saveButtonItem
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        // Creates header view
        headerViewFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 75)
        headerView = UIView(frame: headerViewFrame)
        headerView.backgroundColor = .lightGray
        view.addSubview(headerView)
        
        headerLabelFrame = CGRect(x: 0, y: 0, width: headerView.frame.width, height: headerView.frame.height)
        headerLabel = UILabel(frame: headerLabelFrame)
        headerLabel.textAlignment = .center
        headerLabel.font = UIFont.boldSystemFont(ofSize: 30)
        headerLabel.text = genreString
        headerView.addSubview(headerLabel)
        
        // Initialize frame components of the tableview
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // create and add tableview to the view
        personalTableView = UITableView(frame: CGRect(x: 0, y: headerView.frame.height, width: displayWidth, height: displayHeight))
        personalTableView.estimatedRowHeight = 200
        personalTableView.rowHeight = UITableView.automaticDimension
        personalTableView.register(UITableViewCell.self, forCellReuseIdentifier: "normalCell")
        personalTableView.separatorInset.left = 10
        personalTableView.separatorInset.right = 10
        personalTableView.delegate = self
        personalTableView.dataSource = self
        personalTableView.separatorColor = .black
        self.view.addSubview(personalTableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = personalTableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        return cell
    }
    
    @objc func saveTapped() {
        print("tapped")
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
