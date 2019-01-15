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
    let personalElements = [
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
    var sectionView: UIView!
    var sectionLabel: UILabel!
    let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    var genreString: String = ""
    var expandButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0..<personalElements.count {
            if storage[personalElements[index]] == nil {
                storage[personalElements[index]] = [""]
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
            Expandables(expanded: false, descriptions: storage[personalElements[0]]!),
            Expandables(expanded: false, descriptions: storage[personalElements[1]]!),
            Expandables(expanded: false, descriptions: storage[personalElements[2]]!),
            Expandables(expanded: false, descriptions: storage[personalElements[3]]!),
            Expandables(expanded: false, descriptions: storage[personalElements[4]]!),
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // creates section UIViews
        sectionView = UIView()
        let sectionFrame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 70)
        sectionView?.frame = sectionFrame
        sectionView?.backgroundColor = .white
        
        // section header label for tableView
        let sectionLabelFrame = CGRect(x: 0, y: 0, width: tableView.frame.size.width / 2, height: 70)
        sectionLabel = UILabel()
        sectionLabel.frame = sectionLabelFrame
        sectionLabel.textAlignment = .center
        sectionLabel.font = UIFont.boldSystemFont(ofSize: 20)
        sectionLabel.text = personalElements[section]
        sectionView?.addSubview(sectionLabel)
        
        // button in header for tableView
        let expanded = ideas[section].expanded
        expandButton = UIButton(type: .system)
        expandButton.setTitle(expanded ? "Close" : "Expand", for: .normal)
        expandButton.titleLabel?.font = UIFont(name: "GillSans-Light", size: 20)
        expandButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        expandButton.sizeToFit()
        expandButton.tintColor = .black
        expandButton.frame.origin = CGPoint(x: tableView.frame.size.width - 70, y: 20)
        expandButton.tag = section
        sectionView?.addSubview(expandButton)
        
        return sectionView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ideas[section].expanded {
            return ideas[section].descriptions.count
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return personalElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = personalTableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        cell.textLabel?.text = ideas[indexPath.section].descriptions[indexPath.row]
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let headerHeight: CGFloat = 70
        return headerHeight
    }
    
    // add separators for sections
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        tableView.separatorInset.left = 5
        tableView.separatorInset.right = 15
        let footerView = UIView()
        let separatorView = UIView(frame: CGRect(x: tableView.separatorInset.left, y: footerView.frame.height, width: tableView.frame.width - tableView.separatorInset.right, height: 0.5))
        separatorView.backgroundColor = .black
        footerView.addSubview(separatorView)
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    @objc func saveTapped() {
        print("tapped")
    }
    
    // handles expand/collapse of sections
    @objc func buttonTapped(button: UIButton) {
        var indexPaths = [IndexPath]()
        let section = button.tag
        let expanded = !ideas[section].expanded
        ideas[section].expanded = expanded
        button.setTitle(expanded ? "Close" : "Expand", for: .normal)
        button.sizeToFit()
        for row in ideas[section].descriptions.indices {
            let path = IndexPath(row: row, section: section)
            indexPaths.append(path)
        }
        if !expanded {
            personalTableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            personalTableView.insertRows(at: indexPaths, with: .fade)
        }
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
