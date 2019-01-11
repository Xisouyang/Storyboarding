//  ViewController.swift

//  Storyboarding

//  Created by Stephen Ouyang on 1/9/19.

//  Copyright © 2019 Stephen Ouyang. All rights reserved.

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //    let addButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    
    let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    var mainTableView: UITableView!
    var tmpIdeaArr: [String] = [
        "A Horror Story", "Adventure of a Lifetime", "Mysterious Mystery"
    ]
    var addButtonItem: UIBarButtonItem!
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        
        var addButton: UIBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        
        //        addButton.setTitle("Add", for: .normal)
        //        addButton.tintColor = .white
        //        addButton.addTarget(self, action: #selector(addTapped(sender:)), for:.touchUpInside)
        //        addButton.transform = CGAffineTransform(translationX: 0, y: 50)
        // add the button to a container, otherwise the transform will be ignored
        //        let addButtonContainer = UIView(frame: addButton.frame)
        //        addButtonContainer.addSubview(addButton)
        //        addButtonContainer.isUserInteractionEnabled = true
        //        addButtonItem = UIBarButtonItem(customView: addButtonContainer)
        //        addButtonItem.action = #selector(addTapped(sender:))
        
        // Add traits to navbar
        
        navigationItem.title = "Storyboarding"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
     // navigationItem.rightBarButtonItem = addButtonItem
        navigationItem.rightBarButtonItem = addButton
        navigationItem.rightBarButtonItem?.tintColor = .white
    
        // Initialize frame components of the tableview
        
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        
        
        // create and add tableview to the view
        mainTableView = UITableView(frame: CGRect(x: 0, y: 0, width: displayWidth, height: displayHeight))
        mainTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        mainTableView.delegate = self
        mainTableView.dataSource = self
        self.view.addSubview(mainTableView)
    }
    
    
    
    @objc func addTapped() {
        print("tapped")
    }
    
    
    
    // return number of rows
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    
    
    // create and return cell
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //        var cell = UITableViewCell(style: .default, reuseIdentifier: "reuseIdentifier")
        
        let cellHeight = self.tableView(tableView, heightForRowAt: NSIndexPath(row: indexPath.row, section: indexPath.section) as IndexPath)
        
        let tabImg = UIImage(named: "Tab-Bar")
        
        let tabImgView = UIImageView(image: tabImg)
        
        let tabBarWidth = (tabImg?.size.width)! / 3
        
        let tabBarHeight = (tabImg?.size.height)! / 3
        
        tabImgView.contentMode = UIImageView.ContentMode.scaleAspectFill
        
        tabImgView.frame.size.width = tabBarWidth
        
        tabImgView.frame.size.height = tabBarHeight
        
        
        
        let cell = CustomTableViewCell(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: cellHeight), title: "test")
        
        cell.textLabel?.text = tmpIdeaArr[indexPath.row]
        
        cell.genreLabel.text = "example"
        
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        cell.accessoryView = tabImgView
        
        
        
        return cell
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let rowHeight: CGFloat = 70
        
        return rowHeight
        
    }
    
    
    
    // maintains color of title when scrolling
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
    }
    
    
    
    //    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    
    //        addButton.alpha = 0
    
    //    }
    
    //
    
    //    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    
    //        UIView.animate(withDuration: 1, animations: {
    
    //            self.addButton.alpha = 1.0
    
    //        })
    
    //    }
    
}

