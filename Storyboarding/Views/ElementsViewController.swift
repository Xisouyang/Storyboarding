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
    
    var test: [Expandables] = [
        Expandables(expanded: false, descriptions: ["test", "test", "test", "test", "test"]),
        Expandables(expanded: false, descriptions: ["test", "test", "test", "test", "test"]),
        Expandables(expanded: false, descriptions: ["test", "test", "test", "test", "test"]),
        Expandables(expanded: false, descriptions: ["test", "test", "test", "test", "test"]),
        Expandables(expanded: false, descriptions: ["test", "test", "test", "test", "test"])
    ]
    
    let storyElements = [
        "Adventure Stuff",
        "Horror Stuff",
        "Sci-Fi Stuff",
        "Romance Stuff",
        "Mystery Stuff"
    ]
    var headerView: UIView!
    var sectionView: UIView!
    var sectionLabel: UILabel!
    var expandButton: UIButton!
    
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
        elementTableView.separatorInset.left = 10
        elementTableView.separatorInset.right = 10
        elementTableView.delegate = self
        elementTableView.dataSource = self
        elementTableView.separatorColor = .black
        self.view.addSubview(elementTableView)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        sectionView = UIView()
        let sectionFrame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 70)
        sectionView.frame = sectionFrame
        sectionView.backgroundColor = .white
        
        // section header label for tableView
        let sectionLabelFrame = CGRect(x: 0, y: 0, width: tableView.frame.size.width / 2, height: 70)
        sectionLabel = UILabel()
        sectionLabel.frame = sectionLabelFrame
        sectionLabel.textAlignment = .center
        sectionLabel.font = UIFont.boldSystemFont(ofSize: 20)
        sectionLabel.text = storyElements[section]
        sectionView.addSubview(sectionLabel)
        
        // button in header for tableView
        expandButton = UIButton(type: .system)
        expandButton.setTitle("Expand", for: .normal)
        expandButton.titleLabel?.font = UIFont(name: "GillSans-Light", size: 20)
        expandButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        expandButton.sizeToFit()
        expandButton.tintColor = .black
        expandButton.frame.origin = CGPoint(x: tableView.frame.size.width - 70, y: 20)
        expandButton.tag = section
        sectionView.addSubview(expandButton)
        
        return sectionView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let headerHeight: CGFloat = 70
        return headerHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return storyElements.count
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if test[section].expanded {
            return 5
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = elementTableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        return cell
    }
    
    @objc func buttonTapped(button: UIButton) {
        
        var indexPaths = [IndexPath]()
        let section = button.tag
        let expanded = !test[section].expanded
        test[section].expanded = expanded
        button.setTitle(expanded ? "Close" : "Expand", for: .normal)
        button.sizeToFit()
        for row in test[section].descriptions.indices {
            let path = IndexPath(row: row, section: section)
            indexPaths.append(path)
        }
        if !expanded {
            elementTableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            elementTableView.insertRows(at: indexPaths, with: .fade)
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
